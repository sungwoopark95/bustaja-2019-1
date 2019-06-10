class UsersController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user
      redirect_to new_user_path, danger: '이미 가입된 이메일입니다.'
    else
      @user = User.new(user_params)
      @user.save
      redirect_to new_session_path, success: '가입완료되었습니다.'
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(users_params)
    redirect_to users_show_path
  end
  
  def timeslotize
    @user = User.find(session[:user_id])
  end
  
  def show
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
  
  private
    def user_params
      params.permit(:email, :password, :password_confirmation, :teamname, :start_date, :end_date)
    end
    
    def users_params
      params.require(:user).permit!
    end
end
