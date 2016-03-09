class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :commenters, through: :comments, source: :user
  has_many :likes, as: :likeable
  has_many :likers, through: :likes, source: :user

  validates :content, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true

  has_attached_file :photo, :styles => { :small => "150x150>", :medium => "300x300>", :large => "600x600>" },
        :url  => "/assets/products/:id/:style/:basename.:extension",
        :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/gif', 'image/png']
end
