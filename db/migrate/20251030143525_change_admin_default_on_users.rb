class ChangeAdminDefaultOnUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :admin, from: nil, to: false
    User.where(admin: nil).update_all(admin: false)
    change_column_null :users, :admin, false
  end
end
