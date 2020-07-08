class PostsController < ApplicationController

  def index
    if params[:author_id]
      @posts = Author.find(params[:author_id]).posts 
      
      #index of all posts by a certain author
    else 
      @posts = Post.all 
      #access the index of all posts (Post.all
    end 
  end
  
  #The conditional hinges on whether there's an :author_id key in the params hash — in other words, whether the user navigated to /authors/:id/posts or simply /posts

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

private

  def post_params
    params.require(:post).permit(:title, :desription, :post_status, :author_id)
  end
end
