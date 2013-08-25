class StammrPost < ActiveRecord::Base
  has_many :comments,  :dependent => :destroy
  validates :content,  presence: true, uniqueness: true
end