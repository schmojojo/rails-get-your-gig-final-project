class CreateGigs < ActiveRecord::Migration[7.1]
  def change
    create_table :gigs do |t|
      t.string :title
      t.string :contact
      t.text :description
      t.string :source
      t.string :category
      t.date :date

      t.timestamps
    end
  end
end
