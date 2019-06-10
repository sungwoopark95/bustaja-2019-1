class TimeslotsController < ApplicationController
    def index
        @user = User.find(session[:user_id])
        @timeslot = Timeslot.all
    end
    
    def create
        @user = User.find(session[:user_id])
        @timeslot = @user.timeslot.create(timeslot_params)
        redirect_to timeslots_path
    end

    private
        def timeslot_params
            params.require(:timeslot).permit(:slot)
        end
end
