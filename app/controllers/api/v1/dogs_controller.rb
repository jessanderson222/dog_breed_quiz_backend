class Api::V1::DogsController < ApplicationController

    before_action :find_dog, only: [:update, :destroy, :show]
    def index
      @dogs = Dog.all
      render json: @dogs
    end
    def show

    end 
    def create
      @dog = Dog.create(dog_params)
      render json: @dog, status: :accepted
    end
    def update
      @dog.update(dog_params)
      if @dog.save
        render json: @dog, status: :accepted
      else
        render json: { errors: @dog.errors.full_messages }, status: :unprocessible_entity
      end
    end
    def destroy
      @dog.destroy
      render json: { message: “removed” }, status: :ok
    end
    private
  
    def dog_params
      params.require(:dog).permit(:breed, :img_url)
    end
  
    def find_dog
      @dog = Dog.find(params[:id])
    end

end
