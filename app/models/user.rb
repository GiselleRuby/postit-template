class User < ActiveRecord::Base
	has_many :posts, :foreign_key => 'creator_id'
	has_many :comments, :foreign_key => 'creator_id'
	has_many :votes

	# validates :title, presence: true, length: {minimum: 5}
	validates :username, presence: true, uniqueness: true, length: {minimum: 3}
	validates :password, presence: true, length: {minimum: 3}, on: :create

	has_secure_password validations: false
end
