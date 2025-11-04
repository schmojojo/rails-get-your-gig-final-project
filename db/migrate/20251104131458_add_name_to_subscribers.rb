class AddNameToSubscribers < ActiveRecord::Migration[7.1]
  def change
    add_column :subscribers, :first_name, :string, null: false
    add_column :subscribers, :last_name, :string, null: false
  end
end
