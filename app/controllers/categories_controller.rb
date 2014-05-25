class CategoriesController < ApplicationController
	# before_action :set_category, only: [:show, :edit, :update] 

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
		@category = Category.find(params[:id])
		# binding.pry
	end

	# def edit
	# 	# binding.pry
	# end

	# def update
	# 	# binding.pry
	# 	if @category.update(category_param)
	# 		flash[:notice] = 'update success'
	# 		redirect_to categories_path
	# 	else
	# 		render :edit
	# 	end
	# end

	private

	def category_param
    params.require(:category).permit(:name)    
  end

	# def set_category
	# 	@category = Category.find(params[:id])
	# end

end
