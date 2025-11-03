# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts "Clearing database..."
Gig.destroy_all

puts "Creating freelance gigs..."

# categories = ["Frontend", "Backend", "Full Stack", "UX/UI Design", "Web Design", "Mobile Development", "DevOps"]
# sources = ["Upwork", "Freelancer", "Fiverr", "RemoteOK", "WeWorkRemotely", "LinkedIn"]

# 18.times do
#   category = categories.sample
#   title = case category
#           when "Frontend" then ["React Developer", "Vue.js Freelancer", "Next.js Contractor"].sample
#           when "Backend" then ["Ruby on Rails Developer", "Node.js Engineer", "Django API Specialist"].sample
#           when "Full Stack" then ["Full Stack Developer (React/Rails)", "MERN Developer", "Freelance Web Engineer"].sample
#           when "UX/UI Design" then ["Freelance UX Designer", "UI Prototyper (Figma)", "User Research Specialist"].sample
#           when "Web Design" then ["Webflow Expert", "WordPress Developer", "Freelance Web Designer"].sample
#           when "Mobile Development" then ["React Native Developer", "Flutter Freelancer", "iOS Swift Engineer"].sample
#           when "DevOps" then ["AWS DevOps Engineer", "Docker/Kubernetes Specialist", "CI/CD Pipeline Consultant"].sample
#           end

#   Gig.create!(
#     title: title,
#     contact: Faker::Internet.email,
#     description: Faker::Lorem.paragraph(sentence_count: 4),
#     source: "#",
#     category: category,
#     date: Faker::Date.between(from: Date.today - 7, to: Date.today)
#   )
# end

# puts "✅ 18 freelance gigs created!"

# Creating 18 Real Jobs manually

# Number 1
Gig.create!(
  title: "SENIOR DEVOPS ENGINEER (M/W/D)",
  contact: Faker::Internet.email,
  description: "Wilken Software Group seeks an experienced Platform, SRE, or DevOps Engineer to enhance its cloud architecture with Kubernetes, Terraform, GitOps, and Azure in an agile, flexible, and innovative environment.",
  source: "https://www.wearedevelopers.com/en/companies/3832/wilken-gmbh/47336/senior-devops-engineer-m-w-d",
  category: "DevOps",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 2
Gig.create!(
  title: "Technology Lead ERP & Billing (m/w/d)",
  contact: Faker::Internet.email,
  description: "Wilken Software Group seeks an experienced Technology Lead to define scalable software architectures, drive agile transformation, and empower cross-functional teams while shaping the company’s technological vision and strategy.",
  source: "https://www.wearedevelopers.com/en/companies/3832/wilken-gmbh/37937/technology-lead-erp-billing-m-w-d",
  category: "Full Stack",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 3
Gig.create!(
  title: "Full Stack Developer",
  contact: Faker::Internet.email,
  description: "TGW Logistics GmbH seeks a Full-Stack Developer skilled in HTML, Vue.js, TypeScript, and .NET to design and develop end-to-end software solutions in an agile, collaborative, and flexible work environment.",
  source: "https://www.wearedevelopers.com/en/companies/4095/jobaffairs/47861/full-stack-developer",
  category: "Full Stack",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 4
Gig.create!(
  title: "Software Developer Embedded Systems",
  contact: Faker::Internet.email,
  description: "TGW Logistics GmbH seeks an Embedded Software Engineer to design and develop firmware for embedded systems using C/C++, Python, and Embedded Linux within an agile and innovative environment.",
  source: "https://www.wearedevelopers.com/en/companies/4095/jobaffairs/47859/software-developer-embedded-systems",
  category: "Backend",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 5
Gig.create!(
  title: "DevOps Engineer (m/w/d)",
  contact: Faker::Internet.email,
  description: "Deichmann SE is looking for a DevOps Engineer to design, automate, and manage cloud infrastructures and CI/CD pipelines remotely within Germany, using tools like Python, Ansible, Terraform, Docker, and Kubernetes.",
  source: "https://www.wearedevelopers.com/en/companies/3227/deichmann-se/45900/devops-engineer-m-w-d",
  category: "DevOps",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 6
Gig.create!(
  title: "Frontend Developer (Angular)",
  contact: Faker::Internet.email,
  description: "Picnic Technologies is seeking an experienced Angular frontend developer to build and maintain internal applications supporting their automated grocery operations on-site in Amsterdam.",
  source: "https://www.wearedevelopers.com/en/companies/3853/picnic-technologies/47843/frontend-developer-angular",
  category: "Frontend",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 7
Gig.create!(
  title: "UX/UI-Designer (d/m/w)",
  contact: Faker::Internet.email,
  description: "A full-service B2B agency in Neuss is looking for a creative UX/UI Designer to design websites, apps, and digital campaigns while collaborating with clients and teams, offering hybrid work, 30 vacation days, and a supportive work environment.",
  source: "https://www.bkomm.media/2025/09/ui-ux-designer-m-w-d-gesucht/",
  category: "UX/UI Design",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 8
Gig.create!(
  title: "Webdesigner (m/w/d)",
  contact: Faker::Internet.email,
  description: "CP2 Werbeagentur in Altenstadt is seeking a full-time on-site Web Designer/Developer skilled in WordPress, Elementor, and UX/UI to design and implement modern, responsive websites while collaborating with the creative team.",
  source: "https://cp-2.com/jobs/webdesigner/",
  category: "Web Design",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 8
Gig.create!(
  title: "Webdesigner (m/w/d)",
  contact: Faker::Internet.email,
  description: "CP2 Werbeagentur in Altenstadt is seeking a full-time on-site Web Designer/Developer skilled in WordPress, Elementor, and UX/UI to design and implement modern, responsive websites while collaborating with the creative team.",
  source: "https://cp-2.com/jobs/webdesigner/",
  category: "Web Design",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)



puts "Creating admin user..."

admin_user = User.find_or_initialize_by(email: 'admin@getyourgigs.work')
admin_user.password = 'admin321'
admin_user.password_confirmation = 'admin321'
admin_user.admin = true

if admin_user.save!
  puts "✅ Admin user 'admin@getyourgigs.work' created successfully."
else
  puts "❌ Error creating admin user: #{admin_user.errors.full_messages.join(', ')}"
end
