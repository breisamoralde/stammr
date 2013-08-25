class Comment < ActiveRecord::Base
  belongs_to :stammr_post
  validates :stammr_post, presence: true
  validates :content,  presence: true
end
