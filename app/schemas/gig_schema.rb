class GigSchema < RubyLLM::Schema
  string :title, description: "Job's full title"
  string :description, description: "overview"
  string :source, description: "platform of origin"
  string :category
  string :date, description: "day month year"

  string :contact do
   string :name, required: false
   string :email, required: false
   string :phone, required: false
   string :url
  end
end
