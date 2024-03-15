class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  # has_many :childreplies, class_name: "Reply", foreign_key: "manager_id"
  # belongs_to :manager, class_name: "Reply", optional: true

  belongs_to :parent,  class_name: "Reply"
  has_many   :replies, class_name: "Reply", foreign_key: :parent_id, dependent: :destroy

  validates :body, presence: true
end
