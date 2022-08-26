class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    redirect_to user_posts_path(id: @comment.post_id, user_id: @comment.author_id) if @comment.save
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @post = Post.find(@comment.post_id)
    @comment.destroy!

    @comment.post.decrement!(:commentsCounter)
    flash[:success] = 'Comment deleted successfully'
    redirect_to user_post_path(current_user, @comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :author_id, :post_id)
  end
end
