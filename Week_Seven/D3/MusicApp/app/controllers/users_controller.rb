class UsersController < ApplicationController

    def index
        @users = User.all
        render :index
    end

    def create
        user = User.new(user_params)

        if user.save
            redirect_to user_url(user.id)
        else
            redirec_to users_url
        end
    end
    
    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
