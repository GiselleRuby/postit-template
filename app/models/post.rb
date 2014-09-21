class Post < ActiveRecord::Base
	belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
	has_many :comments, dependent: :destroy
	has_many :post_categories
	has_many :categories, through: :post_categories
	has_many :votes, as: :voteable

	validates :title, presence: true, length: {minimum: 5}
	validates :url, 	presence: true, uniqueness: true
	validates :description, presence: true

	# before_save {|post| post.create_slug}
	before_save :create_slug

	def total_votes
		up_votes - down_votes
	end

	def up_votes
		self.votes.where(vote: true).size
	end

	def down_votes
		self.votes.where(vote: false).size
	end

	def to_param
		self.title_slug
	end

	def create_slug
		self.title_slug = self.title.gsub(" ","-").downcase
	end

end
