class Post < ApplicationRecord
    
 has_one_attached :pimg
 belongs_to :user
 has_many :comments, dependent: :destroy
       
      
end
