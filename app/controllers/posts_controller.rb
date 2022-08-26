class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.where(author_id: params[:user_id]).order(created_at: :desc).includes(:comments, :likes)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
    @params = params
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to user_posts_path(id: @post.id, user_id: @post.author_id)

    else
      render :new, status: :unprocessable_entity, content_type: 'text/html'
      headers['Content-Type'] = 'text/html'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @user = @post.user_id
    respond_to do |format|
      format.html do
        if @post.destroy
          @post.user.decrement!(:postsCounter)
          flash[:success] = 'Post deleted successfully'
          redirect_to user_posts_path(current_user)
        else
          flash.now[:error] = 'Error: Post could not be deleted. Please try again.'
          redirect_to :back
        end
      end
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :text, :author_id)
  end
end
