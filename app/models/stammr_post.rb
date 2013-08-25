class StammrPost < ActiveRecord::Base
  has_many :comments,  :dependent => :destroy
  validates :content,  presence: true
end
