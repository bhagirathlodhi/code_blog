class TochangeNameFullNameToUserName < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :full_name, :username
  end
end
