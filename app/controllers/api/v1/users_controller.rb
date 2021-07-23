class Api::V1::UsersController < ApplicationController

    def get_user
        @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
        if @user
            json_response "success", true, 
            { 
                user: @user,
                dogs: @user.dogs 
            }, 
            :ok
        else
            json_response "Invalid token", false, {}, :not_found
        end
    end

    def add_dog_to_user
        @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
        @dog = params[:dog]

        unless @user.dogs.contains? dog
            user.dogs << params[dog]
        end
    end
end