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
  after_create :welcome

  def welcome
    welcome_email
  end

  def feed
    friend_ids = []
    self.friends.each { |f| friend_ids << f.id }
    Post.where("user_id IN (?) or user_id = ?", friend_ids, id).order("created_at DESC")
  end


  def likes?(likeable)
    self.likes.include?(likeable) 
  end

  private

    def welcome_email
      NoticeMailer.welcome(self).deliver_now!
    end
end
