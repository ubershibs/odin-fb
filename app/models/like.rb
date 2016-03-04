class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  validates :user, presence: true
  validates :likeable, presence: true
end
