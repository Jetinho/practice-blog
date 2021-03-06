class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def home
    @posts = Post.last(3)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(set_params)
    post.user = current_user
    post.save
    redirect_to post_path(post)
  end

  def edit
  end

  def update
    @post.update(set_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

private

  def set_post
    @post = Post.find(params[:id])
  end
  def set_params
    params.require(:post).permit(:title, :content)
  end
end
