class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :commenters, through: :comments, source: :user
  has_many :likes, as: :likeable
  has_many :likers, through: :likes, source: :user

  validates :content, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true

end
