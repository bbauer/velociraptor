class PostsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to client_path(@post.client)
    else
      redirect_to client_path(@post.client)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to client_path(@post.client)
  end

private

  def post_params
    params.require(:post).permit(:comment, :client_id, :user_id)
  end
end
