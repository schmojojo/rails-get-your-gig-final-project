class AiCreateJob < ApplicationJob
  queue_as :default

  SYSTEM_PROMPT = <<-PROMPT

  you are an expert file clerck

  I am a beginner file clerck who wants to filter out a large jobs list into programming jobs only.

  Help me select all the jobs from a jobs list that have either a title, description or category related to the field of tech, programming, design or coding, filter out '\n\n' from (Description:) and display them as an array of Json objects.

  Answer concisely in Markdown.

  PROMPT

  def perform(instructions)
    jobs = fetch_jobs
    ai_jobs = build_ai_jobs(jobs)
    instructions = build_instructions(ai_jobs)
    response = RubyLLM.chat.with_instructions(instructions).with_schema(::GigSchema).ask(nil)

    gigs_json = response.content
    gigs_json["gigs"].each do |gig|
      Gig.create!(
        title: gig["title"],
        description: gig["description"],
        contact: gig["contact"],
        source: gig["source"],
        date: gig["date"],
        category: gig["category"]
      )
    end
  end

  def fetch_jobs
    url = URI("https://api.theirstack.com/v1/jobs/search")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = ENV["BEARER"]
    request.body = {
      page: 0,
      limit: 25,
      job_country_code_or: ["US"],
      posted_at_max_age_days: 7
    }.json
    response = http.request(request)
    JSON.parse(response.body)["data"]
  end

  def build_ai_jobs(jobs)
    jobs do |job|
      Gig.new(
        title: job["job_title"],
        description: job["description"],
        contact: (job["final_url"] || job["company_object"]["linkedin_url"] || job["source_url"]),
        source: job["source_url"],
        date: job["date_posted"],
        category: (job["technology_slugs"][0] || "misc.")
      )
    end
  end

  def build_instructions(ai_jobs)
    text = "here's the info about the jobs in the list:"
    ai_jobs.each do |job|
      text += " Title: #{job.title}, Description: #{job.description} Date: #{job.date}, Source: #{job.source}, Category: #{job.category}, Contact: #{job.contact}"
    end
    [SYSTEM_PROMPT, text].join("\n\n")
  end
end
