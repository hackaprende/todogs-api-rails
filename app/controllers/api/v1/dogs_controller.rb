class Api::V1::DogsController < ApplicationController

    def index
        @dogs = Dog.all 
        json_response "success", true, { dogs: @dogs }, :ok
    end

    def create
        @dog = Dog.new(dog_params)

        if @dog.save
            json_response "Dog created!", true, { dog: @dog}, :ok
        else
            json_response "Error creating dog", false, {}, :ok
        end
    end

    def update
        @dog = Dog.find(params[:id])

        if @dog.update(dog_params)
            json_response "Dog updated!", true, {dog: @dog}, :ok
        else
            json_response "Dog not found", false, {}, :ok
        end
    end

    private
    def dog_params
      params.require(:dog).permit(:dog_type, :height_female, :height_male, :image_url, :index, 
        :life_expectancy, :name_en, :name_es, :temperament, :temperament_en, :weight_female, :weight_male)
    end
end