class Vote < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :voteable, polymorphic: true
  # validates :creator, uniqueness: { scope: :voteable, message: "You can only vote once." }
  validates_uniqueness_of :creator, scope: [:voteable_id, :voteable_type]
end
