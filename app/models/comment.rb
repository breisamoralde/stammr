class Comment < ActiveRecord::Base
  belongs_to :stammr_post
  validates :content,  presence: true
end
