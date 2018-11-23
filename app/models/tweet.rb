class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :text, presence: true
  validates :image, presence: true
end
