class Api::V1::DogsController < ApplicationController

    def index
        @dogs = Dog.all 
        json_response "success", true, { dogs: @dogs }, :ok
    end
end