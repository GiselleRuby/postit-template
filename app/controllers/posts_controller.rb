class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index    
  	@posts = Post.all  	
  end

  def show 
  end

  def edit 
  end

  def update    
    if @post.update(post_param)
      flash[:notice] = "update success"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end


  def new    
    @post = Post.new
  end

  def create
    # binding.pry
    @post = Post.new(post_param)
    @post.creator = User.first #hard code
    # @post.title = params[:post][:title]
    # @post.url = params[:post][:url]

    if @post.save
      # binding.pry
      flash[:notice] = "create new post"
      redirect_to posts_path
    else
      # binding.pry
      render :new
    end
  end

  private

  def post_param
    params.require(:post).permit(:title, :url, :description)    
  end   

  def set_post
    @post = Post.find(params[:id])
  end

end