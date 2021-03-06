class PostsController < ApplicationController
  # not sure how to make this work, it doesn't know what authenticate! is
  skip_before_action :authenticate!, only: [:new, :create, :edit, :update, :destroy], raise: false

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path
    else
      render :show
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end



end
