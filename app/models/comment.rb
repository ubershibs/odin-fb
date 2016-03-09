class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable
  has_many :likers, through: :likes, source: :user
  has_many :notifications, as: :notifiable

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true

end
