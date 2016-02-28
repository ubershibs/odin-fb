class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  validates :user_id, presence: true
  validates :likeable_id, presence: true
  validates :likeable_type, presence: true
  validates_uniqueness_of :user_id, scope: [ :likeable_id, :likeable_type]
end
