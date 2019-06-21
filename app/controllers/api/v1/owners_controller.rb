class API::V1:OwnersController < ApplicationController
    before_action :find_owner, only: [:show, :update, :destroy]
    def index
        @owners = Owner.all 
        render json: @dogs
    end 

    def show
    end 

    def update
        @owner.update(owner_params)
        if @owner.save
            render json: @owner, status: accepted
        else 
            render json: { errors: @owner.errors.full_messages }, status: :unprocessible_entity
        end 
    end 

    def create
        @owner = Owner.create(owner_params)
    end 

    def destroy
        @owner.destroy
        
    end 

    private 

    def owner_params
        params.require(:owner).permit(:name, :profile_picture)
    end 

    def find_owner
        @owner = Owner.find(params[:id])
    end 
end 