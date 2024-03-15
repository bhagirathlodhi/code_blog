class AddReferencesToReplies < ActiveRecord::Migration[7.1]
  def change
    add_column :replies, :parent_id, :integer
  end
end
