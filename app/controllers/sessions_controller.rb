class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login(user)
      redirect_to '/'
      flash[:success] = '성공적으로 로그인되었습니다.'
    else
      redirect_to new_session_path, danger: '잘못된 이메일/비밀번호입니다.'
    end
  end
  
  def destroy
    logout
    redirect_to '/'
  end
end
