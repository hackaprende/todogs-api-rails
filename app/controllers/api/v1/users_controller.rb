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

    def get_user_dogs
        @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
        if @user
            json_response "success", true, 
            {
                dogs: @user.dogs 
            }, 
            :ok
        else
            json_response "Invalid token", false, {}, :not_found
        end
    end

    def add_dog_to_user
        @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
        @dog = Dog.find_by id:params[:dog_id]

        if @user == nil
            json_response "user_not_found", false, {}, :ok
            return
        end

        unless @user.dogs.include? @dog
            @user.dogs << @dog
            json_response "Dog added to user!", true, {}, :ok
        else
            json_response "Dog already belongs to user", true, {}, :ok 
        end
    end

    def remove_dog_for_user
        @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
        @dog = Dog.find_by id:params[:dog_id]

        if @user == nil
            json_response "user_not_found", false, {}, :ok
            return
        end

        if @user.dogs.include? @dog
            @user.dogs.delete @dog
            json_response "Dog removed for user", true, {}, :ok
        else
            json_response "User has not that dog", true, {}, :ok 
        end

    end
end