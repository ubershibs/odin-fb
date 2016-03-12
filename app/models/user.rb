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
  has_many :notifications, as: :notifiable
  has_many :photos, through: :posts
  after_create :welcome

  has_attached_file :avatar, styles: { medium: "400x400>", thumb: "120x120>", tiny: "40x40>" },  :url  => "/assets/users/:id/:style/:basename.:extension",
      :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
 validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/gif', 'image/png']


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
