class ToAddNewColumnToreply < ActiveRecord::Migration[7.1]
  def change
    add_column :replies, :parent_comment_id, :integer
  end
end
