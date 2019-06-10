class SearchController < ApplicationController
  def search
    if params[:search]
      @users = User.where('teamname LIKE ?', "%#{params[:search]}%")
    else
      @users = User.all
    end
  end
end
