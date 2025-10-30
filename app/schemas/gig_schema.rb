class GigSchema < RubyLLM::Schema
  array :gigs do
    object do
      string :title, description: "Job's full title"
      string :description, description: "overview"
      string :source, description: "origin url"
      string :category
      string :date, description: "day month year"

      string :contact do
       string :name, required: false
       string :email, required: false
       string :phone, required: false
       string :url
      end
    end
  end
end
