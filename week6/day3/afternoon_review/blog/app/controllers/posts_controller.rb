class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "New Post successfully created"
    else
      flash[:alert] = "Error Occured"
      render :new
    end
  end

  def edit; end
  def update; end
  def destroy; end

  private
  def post_params
    params.require(:post).permit(:title, :body, :category)
  end
end
