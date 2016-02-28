class User < ActiveRecord::Base
  include Amistad::FriendModel

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, allow_nil: true, allow_blank: false,
            length: { maximum: 50 }
            
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_posts, through: :likes, source: :likeable, source_type: "Post"
  has_many :liked_comments, through: :likes, source: :likeable, source_type: "Comment"

  def likes?(likeable)
    self.likes.include?(likeable) 
  end
end
