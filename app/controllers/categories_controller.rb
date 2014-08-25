class CategoriesController < ApplicationController
	# before_action :set_category, only: [:show, :edit, :update]
	before_action :require_user, only: [:create]

	# def index
	# 	# binding.pry
	# 	@categories = Category.all
	# end

	def new
		# binding.pry
		@category = Category.new
	end

	def create
		# binding.pry
		@category = Category.create(category_param)

		if @category.save
			flash[:notice] = 'create success'
			redirect_to posts_path
		else
			render :new
		end
	end

	def show
		# binding.pry
		@category = Category.find(params[:id])
	end

	private

	def category_param
    params.require(:category).permit(:name)
  end


end
