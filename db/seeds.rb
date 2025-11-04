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

# Creating 0 - 25 Real Jobs manually

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
  title: "Marketing Manager (all genders)",
  contact: Faker::Internet.email,
  description: "JAAI Group is seeking a creative, versatile marketing professional to design campaigns, corporate materials, social media content, and manage SEA activities for multiple AI and tech subsidiaries in a dynamic, collaborative environment.",
  source: "https://jaai.jobs.personio.de/job/2391872?display=de&language=de&pid=4f6ef8b5-f939-4f87-af2c-a2c52531b62a&it=6rqGWHorRphKeBccjmuniA",
  category: "Marketing",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 9
Gig.create!(
  title: "Tech Lead Frontend",
  contact: Faker::Internet.email,
  description: "SMG Swiss Marketplace Group is looking for a hands-on Tech Lead with expertise in TypeScript, React, and Next.js to guide a cross-functional team, shape architecture, and deliver scalable web and hybrid app products in a hybrid Belgrade-based environment.",
  source: "https://www.wearedevelopers.com/en/companies/3301/smg-swiss-marketplace-group/47841/tech-lead-frontend",
  category: "Frontend",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 10
Gig.create!(
  title: "IT-Risikomanager (m/w/d)",
  contact: Faker::Internet.email,
  description: "Dirk Rossmann GmbH is seeking an IT Risk & Compliance specialist to develop and implement IT risk strategies, support teams in risk assessment, and ensure governance in a hybrid Burgwedel-based role.",
  source: "https://www.wearedevelopers.com/en/companies/3538/dirk-rossmann-gmbh/47837/it-risikomanager-m-w-d",
  category: "IT",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 11
Gig.create!(
  title: "(Senior) UX Designer (m/w/d)",
  contact: Faker::Internet.email,
  description: "Vialytics is looking for an experienced UX/UI Product Designer to create intuitive, high-quality digital experiences for their road management SaaS platform, working collaboratively in a hybrid Stuttgart-based role.",
  source: "https://career.vialytics.com/jobs/6469441-senior-ux-designer-m-w-d",
  category: "UX/UI Design",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 12
Gig.create!(
  title: "UX/UI-DesignerIn (m/w/d)",
  contact: Faker::Internet.email,
  description: "OUTERMEDIA is seeking an experienced UX/UI Designer to create user-centered digital experiences for cultural and educational web and app projects, collaborating in a flexible Berlin-based role.",
  source: "https://www.outermedia.de/uxui-designerin-mwd",
  category: "UX/UI Design",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 13
Gig.create!(
  title: "(Senior) IT-Auditor (w/m/d)",
  contact: Faker::Internet.email,
  description: "B. Braun SE is hiring an experienced IT Auditor to lead risk-based audits and advisory activities in IT processes, security, and compliance, with international travel and hybrid work options in Melsungen, Germany.",
  source: "https://www.wearedevelopers.com/en/companies/1611/tech-jobs/47765/senior-it-auditor-w-m-d",
  category: "IT",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 14
Gig.create!(
  title: "Web Developer E-Mail-Marketing",
  contact: Faker::Internet.email,
  description: "Entergon is looking for a web-savvy E-Mail/Marketing Automation specialist to create and manage modern email templates, landing pages, and campaigns while working closely with clients in a flexible, hybrid environment.",
  source: "https://www.stepstone.de/stellenangebote--Web-Developer-E-Mail-Marketing-Marketing-Automation-m-w-d-Friedrichsdorf-entergon-GmbH-Co-KG--12614619-inline.html?cid=partner_designmadeingermany___SP",
  category: "Marketing",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 15
Gig.create!(
  title: "Senior Database Administrator",
  contact: Faker::Internet.email,
  description: "The company is seeking a Senior Database Administrator with 5+ years of multi-platform experience to ensure the performance, reliability, security, and scalability of enterprise databases while leading technical projects and mentoring teams.",
  source: "https://www.eurotechjobs.com/job_display/282589/Senior_Database_Administrator_ATT_Bratislava_Slovakia",
  category: "Data",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 16
Gig.create!(
  title: "Lead Data Governance Engineer",
  contact: Faker::Internet.email,
  description: "Apple is seeking a Data Governance Engineer to design, implement, and maintain scalable data governance frameworks and analytics solutions that ensure data integrity, privacy, and actionable insights across the company.",
  source: "https://www.eurotechjobs.com/job_display/282534/Lead_Data_Governance_Engineer_Apple_Dublin_Ireland",
  category: "Data",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 17
Gig.create!(
  title: "Senior JavaScript Developer (React, Next.js)",
  contact: Faker::Internet.email,
  description: "A company is looking for a Senior JavaScript Developer with expertise in Next.js, React, and TypeScript to design, build, and maintain scalable, responsive web interfaces while mentoring team members and participating in the full development lifecycle.",
  source: "https://www.eurotechjobs.com/job_display/282473/Senior_JavaScript_Developer_React_Nextjs_Sirma_Group_Sofia_Varna_Kazanlak_Ruse_or_Remote_Bulgaria",
  category: "Data",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 18
Gig.create!(
  title: "Expert Full Stack Engineer",
  contact: Faker::Internet.email,
  description: "A company is seeking an Expert Full Stack Engineer to lead a small team, develop scalable frontend and backend solutions using modern AI and cloud technologies, drive technical decisions, and mentor engineers.",
  source: "https://www.eurotechjobs.com/job_display/282431/Expert_Full_Stack_Engineer_Ciklum_Remote_Poland",
  category: "Full Stack",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 19
Gig.create!(
  title: "(Senior) Backend Web Developer",
  contact: Faker::Internet.email,
  description: "A company is seeking a Senior Backend Web Developer to build and maintain scalable web backend systems, APIs, and workflows for a 3D XR frontline platform while collaborating in a modern development environment.",
  source: "https://www.eurotechjobs.com/job_display/281046/Senior_Backend_Web_Developer_TeamViewer_Porto_Portugal",
  category: "Backend",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 20
Gig.create!(
  title: "Backend Java Developer",
  contact: Faker::Internet.email,
  description: "Ubisoft Barcelona Mobile is looking for a Backend Java Developer to build and maintain scalable server systems for live mobile games, collaborating with teams to support millions of players worldwide.",
  source: "https://www.eurotechjobs.com/job_display/282773/Backend_Java_Developer_Ubisoft_Barcelona_Spain",
  category: "Backend",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 21
Gig.create!(
  title: "Data Scientist",
  contact: Faker::Internet.email,
  description: "The company is seeking a Data Scientist with strong software engineering skills to develop, deploy, and maintain scalable machine learning solutions across business functions.",
  source: "https://www.eurotechjobs.com/job_display/282716/Data_Scientist_Pirelli_Bari_Italy",
  category: "Data",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 22
Gig.create!(
  title: "Frontend Engineer (all genders)",
  contact: Faker::Internet.email,
  description: "Avelios is hiring a (Senior) Frontend Engineer in Munich to develop intuitive, scalable digital interfaces for hospitals using React, TypeScript, or Swift.",
  source: "https://www.linkedin.com/jobs/search?keywords=frontend&location=Munich&geoId=100477049&trk=public_jobs_jobs-search-bar_search-submit&position=1&pageNum=0",
  category: "Frontend",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 23
Gig.create!(
  title: "IT Administrator - Junior",
  contact: Faker::Internet.email,
  description: "An owner-operated IT services company is hiring an IT Administrator to plan, manage, and support client infrastructure and cloud solutions, offering €40,000–€45,000/year.",
  source: "https://de.linkedin.com/jobs/view/it-administrator-junior-at-oppcourt-4317218340?position=4&pageNum=0&refId=atoWJKmAJ3YT2srLGuxkaA%3D%3D&trackingId=xeMtNEw9m6ZDeZgySdgapQ%3D%3D",
  category: "IT",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 24
Gig.create!(
  title: "IT-Architect (m/w/d)",
  contact: Faker::Internet.email,
  description: "Deutsche Fachpflege Holding is hiring an IT Architect to design, modernize, and secure IT infrastructure and systems while advising leadership, with hybrid work options across several German cities.",
  source: "https://www.wearedevelopers.com/en/companies/3038/personalwerk-gmbh/47759/it-architekt-in-m-w-d",
  category: "IT",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 25
Gig.create!(
  title: "Webdesigner (m/w/d)",
  contact: Faker::Internet.email,
  description: "CP2 Werbeagentur in Altenstadt is seeking a full-time on-site Web Designer/Developer skilled in WordPress, Elementor, and UX/UI to design and implement modern, responsive websites while collaborating with the creative team.",
  source: "https://cp-2.com/jobs/webdesigner/",
  category: "Web Design",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Creating 26 - 50 Real Jobs manually (Copy Paste with different order)

# Number 26
Gig.create!(
  title: "UX/UI-Designer (d/m/w)",
  contact: Faker::Internet.email,
  description: "A full-service B2B agency in Neuss is looking for a creative UX/UI Designer to design websites, apps, and digital campaigns while collaborating with clients and teams, offering hybrid work, 30 vacation days, and a supportive work environment.",
  source: "https://www.bkomm.media/2025/09/ui-ux-designer-m-w-d-gesucht/",
  category: "UX/UI Design",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 27
Gig.create!(
  title: "Marketing Manager (all genders)",
  contact: Faker::Internet.email,
  description: "JAAI Group is seeking a creative, versatile marketing professional to design campaigns, corporate materials, social media content, and manage SEA activities for multiple AI and tech subsidiaries in a dynamic, collaborative environment.",
  source: "https://jaai.jobs.personio.de/job/2391872?display=de&language=de&pid=4f6ef8b5-f939-4f87-af2c-a2c52531b62a&it=6rqGWHorRphKeBccjmuniA",
  category: "Marketing",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 28
Gig.create!(
  title: "Tech Lead Frontend",
  contact: Faker::Internet.email,
  description: "SMG Swiss Marketplace Group is looking for a hands-on Tech Lead with expertise in TypeScript, React, and Next.js to guide a cross-functional team, shape architecture, and deliver scalable web and hybrid app products in a hybrid Belgrade-based environment.",
  source: "https://www.wearedevelopers.com/en/companies/3301/smg-swiss-marketplace-group/47841/tech-lead-frontend",
  category: "Frontend",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 29
Gig.create!(
  title: "Webdesigner (m/w/d)",
  contact: Faker::Internet.email,
  description: "CP2 Werbeagentur in Altenstadt is seeking a full-time on-site Web Designer/Developer skilled in WordPress, Elementor, and UX/UI to design and implement modern, responsive websites while collaborating with the creative team.",
  source: "https://cp-2.com/jobs/webdesigner/",
  category: "Web Design",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 30
Gig.create!(
  title: "Technology Lead ERP & Billing (m/w/d)",
  contact: Faker::Internet.email,
  description: "Wilken Software Group seeks an experienced Technology Lead to define scalable software architectures, drive agile transformation, and empower cross-functional teams while shaping the company’s technological vision and strategy.",
  source: "https://www.wearedevelopers.com/en/companies/3832/wilken-gmbh/37937/technology-lead-erp-billing-m-w-d",
  category: "Full Stack",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 31
Gig.create!(
  title: "Full Stack Developer",
  contact: Faker::Internet.email,
  description: "TGW Logistics GmbH seeks a Full-Stack Developer skilled in HTML, Vue.js, TypeScript, and .NET to design and develop end-to-end software solutions in an agile, collaborative, and flexible work environment.",
  source: "https://www.wearedevelopers.com/en/companies/4095/jobaffairs/47861/full-stack-developer",
  category: "Full Stack",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 32
Gig.create!(
  title: "Frontend Developer (Angular)",
  contact: Faker::Internet.email,
  description: "Picnic Technologies is seeking an experienced Angular frontend developer to build and maintain internal applications supporting their automated grocery operations on-site in Amsterdam.",
  source: "https://www.wearedevelopers.com/en/companies/3853/picnic-technologies/47843/frontend-developer-angular",
  category: "Frontend",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 33
Gig.create!(
  title: "Software Developer Embedded Systems",
  contact: Faker::Internet.email,
  description: "TGW Logistics GmbH seeks an Embedded Software Engineer to design and develop firmware for embedded systems using C/C++, Python, and Embedded Linux within an agile and innovative environment.",
  source: "https://www.wearedevelopers.com/en/companies/4095/jobaffairs/47859/software-developer-embedded-systems",
  category: "Backend",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 34
Gig.create!(
  title: "DevOps Engineer (m/w/d)",
  contact: Faker::Internet.email,
  description: "Deichmann SE is looking for a DevOps Engineer to design, automate, and manage cloud infrastructures and CI/CD pipelines remotely within Germany, using tools like Python, Ansible, Terraform, Docker, and Kubernetes.",
  source: "https://www.wearedevelopers.com/en/companies/3227/deichmann-se/45900/devops-engineer-m-w-d",
  category: "DevOps",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 35
Gig.create!(
  title: "IT-Architect (m/w/d)",
  contact: Faker::Internet.email,
  description: "Deutsche Fachpflege Holding is hiring an IT Architect to design, modernize, and secure IT infrastructure and systems while advising leadership, with hybrid work options across several German cities.",
  source: "https://www.wearedevelopers.com/en/companies/3038/personalwerk-gmbh/47759/it-architekt-in-m-w-d",
  category: "IT",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 36
Gig.create!(
  title: "SENIOR DEVOPS ENGINEER (M/W/D)",
  contact: Faker::Internet.email,
  description: "Wilken Software Group seeks an experienced Platform, SRE, or DevOps Engineer to enhance its cloud architecture with Kubernetes, Terraform, GitOps, and Azure in an agile, flexible, and innovative environment.",
  source: "https://www.wearedevelopers.com/en/companies/3832/wilken-gmbh/47336/senior-devops-engineer-m-w-d",
  category: "DevOps",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 37
Gig.create!(
  title: "Lead Data Governance Engineer",
  contact: Faker::Internet.email,
  description: "Apple is seeking a Data Governance Engineer to design, implement, and maintain scalable data governance frameworks and analytics solutions that ensure data integrity, privacy, and actionable insights across the company.",
  source: "https://www.eurotechjobs.com/job_display/282534/Lead_Data_Governance_Engineer_Apple_Dublin_Ireland",
  category: "Data",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 38
Gig.create!(
  title: "Senior JavaScript Developer (React, Next.js)",
  contact: Faker::Internet.email,
  description: "A company is looking for a Senior JavaScript Developer with expertise in Next.js, React, and TypeScript to design, build, and maintain scalable, responsive web interfaces while mentoring team members and participating in the full development lifecycle.",
  source: "https://www.eurotechjobs.com/job_display/282473/Senior_JavaScript_Developer_React_Nextjs_Sirma_Group_Sofia_Varna_Kazanlak_Ruse_or_Remote_Bulgaria",
  category: "Data",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 39
Gig.create!(
  title: "Expert Full Stack Engineer",
  contact: Faker::Internet.email,
  description: "A company is seeking an Expert Full Stack Engineer to lead a small team, develop scalable frontend and backend solutions using modern AI and cloud technologies, drive technical decisions, and mentor engineers.",
  source: "https://www.eurotechjobs.com/job_display/282431/Expert_Full_Stack_Engineer_Ciklum_Remote_Poland",
  category: "Full Stack",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 40
Gig.create!(
  title: "Frontend Engineer (all genders)",
  contact: Faker::Internet.email,
  description: "Avelios is hiring a (Senior) Frontend Engineer in Munich to develop intuitive, scalable digital interfaces for hospitals using React, TypeScript, or Swift.",
  source: "https://www.linkedin.com/jobs/search?keywords=frontend&location=Munich&geoId=100477049&trk=public_jobs_jobs-search-bar_search-submit&position=1&pageNum=0",
  category: "Frontend",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 41
Gig.create!(
  title: "IT Administrator - Junior",
  contact: Faker::Internet.email,
  description: "An owner-operated IT services company is hiring an IT Administrator to plan, manage, and support client infrastructure and cloud solutions, offering €40,000–€45,000/year.",
  source: "https://de.linkedin.com/jobs/view/it-administrator-junior-at-oppcourt-4317218340?position=4&pageNum=0&refId=atoWJKmAJ3YT2srLGuxkaA%3D%3D&trackingId=xeMtNEw9m6ZDeZgySdgapQ%3D%3D",
  category: "IT",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 42
Gig.create!(
  title: "IT-Risikomanager (m/w/d)",
  contact: Faker::Internet.email,
  description: "Dirk Rossmann GmbH is seeking an IT Risk & Compliance specialist to develop and implement IT risk strategies, support teams in risk assessment, and ensure governance in a hybrid Burgwedel-based role.",
  source: "https://www.wearedevelopers.com/en/companies/3538/dirk-rossmann-gmbh/47837/it-risikomanager-m-w-d",
  category: "IT",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 43
Gig.create!(
  title: "(Senior) UX Designer (m/w/d)",
  contact: Faker::Internet.email,
  description: "Vialytics is looking for an experienced UX/UI Product Designer to create intuitive, high-quality digital experiences for their road management SaaS platform, working collaboratively in a hybrid Stuttgart-based role.",
  source: "https://career.vialytics.com/jobs/6469441-senior-ux-designer-m-w-d",
  category: "UX/UI Design",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 44
Gig.create!(
  title: "UX/UI-DesignerIn (m/w/d)",
  contact: Faker::Internet.email,
  description: "OUTERMEDIA is seeking an experienced UX/UI Designer to create user-centered digital experiences for cultural and educational web and app projects, collaborating in a flexible Berlin-based role.",
  source: "https://www.outermedia.de/uxui-designerin-mwd",
  category: "UX/UI Design",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 45
Gig.create!(
  title: "(Senior) IT-Auditor (w/m/d)",
  contact: Faker::Internet.email,
  description: "B. Braun SE is hiring an experienced IT Auditor to lead risk-based audits and advisory activities in IT processes, security, and compliance, with international travel and hybrid work options in Melsungen, Germany.",
  source: "https://www.wearedevelopers.com/en/companies/1611/tech-jobs/47765/senior-it-auditor-w-m-d",
  category: "IT",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 46
Gig.create!(
  title: "(Senior) Backend Web Developer",
  contact: Faker::Internet.email,
  description: "A company is seeking a Senior Backend Web Developer to build and maintain scalable web backend systems, APIs, and workflows for a 3D XR frontline platform while collaborating in a modern development environment.",
  source: "https://www.eurotechjobs.com/job_display/281046/Senior_Backend_Web_Developer_TeamViewer_Porto_Portugal",
  category: "Backend",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 47
Gig.create!(
  title: "Backend Java Developer",
  contact: Faker::Internet.email,
  description: "Ubisoft Barcelona Mobile is looking for a Backend Java Developer to build and maintain scalable server systems for live mobile games, collaborating with teams to support millions of players worldwide.",
  source: "https://www.eurotechjobs.com/job_display/282773/Backend_Java_Developer_Ubisoft_Barcelona_Spain",
  category: "Backend",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 48
Gig.create!(
  title: "Web Developer E-Mail-Marketing",
  contact: Faker::Internet.email,
  description: "Entergon is looking for a web-savvy E-Mail/Marketing Automation specialist to create and manage modern email templates, landing pages, and campaigns while working closely with clients in a flexible, hybrid environment.",
  source: "https://www.stepstone.de/stellenangebote--Web-Developer-E-Mail-Marketing-Marketing-Automation-m-w-d-Friedrichsdorf-entergon-GmbH-Co-KG--12614619-inline.html?cid=partner_designmadeingermany___SP",
  category: "Marketing",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 49
Gig.create!(
  title: "Senior Database Administrator",
  contact: Faker::Internet.email,
  description: "The company is seeking a Senior Database Administrator with 5+ years of multi-platform experience to ensure the performance, reliability, security, and scalability of enterprise databases while leading technical projects and mentoring teams.",
  source: "https://www.eurotechjobs.com/job_display/282589/Senior_Database_Administrator_ATT_Bratislava_Slovakia",
  category: "Data",
  date: Faker::Date.between(from: Date.today - 7, to: Date.today)
)

# Number 50
Gig.create!(
  title: "Data Scientist",
  contact: Faker::Internet.email,
  description: "The company is seeking a Data Scientist with strong software engineering skills to develop, deploy, and maintain scalable machine learning solutions across business functions.",
  source: "https://www.eurotechjobs.com/job_display/282716/Data_Scientist_Pirelli_Bari_Italy",
  category: "Data",
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
