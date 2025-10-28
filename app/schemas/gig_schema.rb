class GigSchema < RubyLLM::Schema
  string :title, description: "Job's full title"
  string :description, description: "overview"
  string :source, description: "platform of origin"
  string :category
  date :date

  string :contact do
   string :name
   string :email
   string :phone, required: false
  end
end
