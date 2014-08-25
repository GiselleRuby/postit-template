class CommentsController < ApplicationController
	before_action :require_user
	before_action :set_post_and_comment, only: [:vote]

	def create
		# binding.pry

    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = current_user

    if @comment.save
			flash[:notice] = 'Your comment was added'
			redirect_to post_path(@post)
		else
      # binding.pry
			render 'posts/show'
		end
	end

	def vote
		@vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
		# binding.pry

		if @vote.valid?
			flash[:notice] = "Your vote was counted."
		else
			flash[:error] = "You can only vote on a comment once."
		end
		redirect_to :back
	end

	def set_post_and_comment
		@post = Post.find(params[:post_id])
		# @comment = @post.comments.find_by(params[:id])
		@comment = Comment.find(params[:id])
	end
end
