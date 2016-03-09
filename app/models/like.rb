class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  has_many :notifications, as: :notifiable
  validates :user, presence: true
  validates :likeable, presence: true
end
