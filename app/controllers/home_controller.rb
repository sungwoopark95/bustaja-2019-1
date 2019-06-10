class HomeController < ApplicationController
  def index
  end
  
  def show
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
end
