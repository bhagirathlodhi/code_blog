class DropTablename < ActiveRecord::Migration[7.1]
  def change
    drop_table :replies
  end
end
