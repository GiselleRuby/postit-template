class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, only: [:edit, :update, :create, :vote]

  def index
  	@posts = Post.all.sort_by {|e| e.total_votes}.reverse
  end

  def show
  	@comment = Comment.new
  end

  def edit
  end

  def update
  	# binding.pry

    # @post.categories = []
    # categories_param

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
    @post.creator = current_user

    if @post.save
      # binding.pry
      flash[:notice] = "create new post"
      redirect_to posts_path
    else
      # binding.pry
      render :new
    end
  end

  def vote
    @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])

    if @vote.valid?
      flash[:notice] = "Your vote was counted."
    else
      flash[:error] = "You can only vote once."
    end

    redirect_to :back
  end

  private

  def post_param
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
