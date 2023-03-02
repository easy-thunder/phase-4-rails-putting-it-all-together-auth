class RecipesController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :not_found
    before_action :authorize
    rescue_from ActiveRecord::RecordInvalid, with: :invalid


    def index 
        render json: Recipe.all
    end

    def create 
        user = User.find_by(id: session[:user_id])

        recipe = user.recipes.create!(recipe_params)
        render json: recipe, status: :created
    end






    private 

    def authorize 
        render json: {errors: ["unathorized", "bad"]}, status: :unauthorized unless session.include? :user_id
    end
    def invalid (e)
        render json: {errors: [e.record.errors.full_messages]}, status: :unprocessable_entity
    end
    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete, :user_id)
    end
    # def not_found(e)
    #     # render json: {error: e}, status: :not_found
    # end

end
