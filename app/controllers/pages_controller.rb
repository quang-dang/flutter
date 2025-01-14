class PagesController < ApplicationController
  def index
  end

  def home
    @posts = Post.all
    @newPost = Post.new
  end

  def profile
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice => "User not found"
    end
    
    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]))
    
    @newPost = Post.new
    @toFollow = User.all.first(5)
  end

  def explore
    @posts = Post.all
  end
end
