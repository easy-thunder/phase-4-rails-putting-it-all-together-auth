class UsersController < ApplicationController  
    before_action :authorize
    skip_before_action :authorize, only:[:signup]
rescue_from ActiveRecord::RecordInvalid, with: :invalid

    

    def signup 
        user = User.create!(user_params)
            session[:user_id]=user.id 
            render json: user, status: :created
    end

    def show 
        if session[:user_id]
            user = User.find_by(id: session[:user_id])
            render json: user, serializer: UserNoPasswordReturnSerializer, status: :ok
        end
    end
    



    private 
    def authorize 
        render json: {error: ["unathorized", "bad"]}, status: :unauthorized unless session.include? :user_id
    end

    def invalid (e)
        render json: {errors: ["bad", "notgood"]}, status: :unprocessable_entity
    end

    def user_params
        params.permit(:username, :password, :image_url, :bio, :password_confirmation)
    end
end
