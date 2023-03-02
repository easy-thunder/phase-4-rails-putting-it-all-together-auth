class SessionsController < ApplicationController
    # skip_before_action :authorize, only: :create
    # before_action :authorize
    # skip_before_action :authorize, only:[:signup]
    def create 
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id 
            render json: user, status: :created
    else render json: { error: "invalid username or password"}, status: :unauthorized
    end
end

def destroy 
    if session[:user_id]
session.delete :user_id
    else 
        render json: {errors: ["not good", "bad"]}, status: :unauthorized
    end
end





end
