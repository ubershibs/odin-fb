class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, allow_nil: true, allow_blank: false,
            length: { maximum: 50 }
            
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

end
