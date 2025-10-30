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

categories = ["Frontend", "Backend", "Full Stack", "UX/UI Design", "Web Design", "Mobile Development", "DevOps"]
sources = ["Upwork", "Freelancer", "Fiverr", "RemoteOK", "WeWorkRemotely", "LinkedIn"]

18.times do
  category = categories.sample
  title = case category
          when "Frontend" then ["React Developer", "Vue.js Freelancer", "Next.js Contractor"].sample
          when "Backend" then ["Ruby on Rails Developer", "Node.js Engineer", "Django API Specialist"].sample
          when "Full Stack" then ["Full Stack Developer (React/Rails)", "MERN Developer", "Freelance Web Engineer"].sample
          when "UX/UI Design" then ["Freelance UX Designer", "UI Prototyper (Figma)", "User Research Specialist"].sample
          when "Web Design" then ["Webflow Expert", "WordPress Developer", "Freelance Web Designer"].sample
          when "Mobile Development" then ["React Native Developer", "Flutter Freelancer", "iOS Swift Engineer"].sample
          when "DevOps" then ["AWS DevOps Engineer", "Docker/Kubernetes Specialist", "CI/CD Pipeline Consultant"].sample
          end

  Gig.create!(
    title: title,
    contact: Faker::Internet.email,
    description: Faker::Lorem.paragraph(sentence_count: 4),
    source: "#",
    category: category,
    date: Faker::Date.between(from: Date.today - 7, to: Date.today)
  )
end

puts "✅ 18 freelance gigs created!"

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
