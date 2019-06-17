class PostsController < ApplicationController
  def index
    
  end
  
  def new
    @posts = Post.all.reverse
    @user = User.find(session[:user_id])
    @start = @user.start_date
    @end = @user.end_date
    @span = @end - @start
    @passed = Date.today - @start
    @progress = @passed.to_i * 20 / @span.to_i
    
    
    @post_progress = Hash.new
    
    (0...Post.all.length).each do |i|
      @post_progress[i] = (Post.all[i].created_at.to_date - @start).to_i * 20 / @span.to_i
    end
    
    @significant = Array(@post_progress.values) + Array(@progress)
  end
  
  def create
    post = Post.new(user_id: current_user.id, title: params[:title], content: params[:content])
    post.save
    redirect_to new_post_path
  end
  
  def edit
    @posts = Post.all.reverse
    @user = User.find(session[:user_id])
    @start = @user.start_date
    @end = @user.end_date
    @span = @end - @start
    @passed = Date.today - @start
    @progress = @passed.to_i * 20 / @span.to_i
    
    @post_progress = Hash.new
    
    (0...Post.all.length).each do |i|
      @post_progress[i] = (Post.all[i].created_at.to_date - @start).to_i * 20 / @span.to_i
    end
    
    @significant = Array(@post_progress.values) + Array(@progress)
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    redirect_to posts_path if @post.user_id != current_user.id
    
    @post.title = params[:title]
    @post.content = params[:content]
    
    if @post.save
      redirect_to new_post_path
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    redirect_to new_post_path if @post.user_id != current_user.id
    
    @post.destroy
    redirect_to new_post_path
  end
end
