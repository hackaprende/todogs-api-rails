class Api::V1::DogsController < ApplicationController

    def index
        @dogs = Dog.all 
        json_response "success", true, { dogs: @dogs }, :ok
    end

    def show
        @dog = Dog.find(params[:id])

        if @dog
            json_response "Dog found", true, { dog: @dog }, :ok
        else 
            json_response "dog_not_found", false, {}, :ok
        end
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
            json_response "dog_not_found", false, {}, :ok
        end
    end

    def destroy
        @dog = Dog.find(params[:id])
        @dog.destroy

        json_response "Dog removed!", true, {}, :ok
    end

    private
    def dog_params
      params.require(:dog).permit(:dog_type, :ml_id, :height_female, :height_male, :image_url, :index, 
        :life_expectancy, :name_en, :name_es, :temperament, :temperament_en, :weight_female, :weight_male)
    end
end