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
  has_many :notifications, foreign_key: :recipient_id
  after_create :welcome

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def welcome
    welcome_email
  end

  def feed
    friend_ids = []
    self.friends.each { |f| friend_ids << f.id }
    Post.where("user_id IN (?) or user_id = ?", friend_ids, id).order("created_at DESC")
  end

  def likes?(likeable)
    if likeable.class == Post
      self.liked_posts.include?(likeable)
    elsif likeable.class == Comment
      self.liked_comments.include?(likeable)
    end
  end

  private

    def welcome_email
      NoticeMailer.welcome(self).deliver_now!
    end
end
