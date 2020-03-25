class SessionsController < ApplicationController

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user
            login!(@user)
            redirect_to user_url(@user.id)
        else
            redirect_to new_sessions_url
        end
    end
    
end
