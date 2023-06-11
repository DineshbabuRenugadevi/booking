class UsersController < ApplicationController

    def index
        @user = User.all
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          flash[:notice] = "Your account information was successfully updated"
          redirect_to users_path
        else
          render 'edit'
        end
    end

    def show
      @user = User.find(params[:id])
      @meetings = @user.meetings
  end

end