class RentsController < ApplicationController
    before_action :authorize_request
    before_action :find_rent, only: [:update,:show,:destroy]
  
    def index
        @rents = User.find_by!(username: params[:user__username]).rents.all
        render json:@rents, status: :ok
    end

    def create
        @rent = User.find_by!(username: params[:user__username]).rents.new(rent_params)
        
        if @rent.save
            render json: @rent, status: :created
        else
            render json: { errors: @rent.errors.full_messages },
                   status: :unprocessable_entity
        end
    end

    def update
        unless @rent.update(user_params)
            render json: { errors: @rent.errors.full_messages },
                   status: :unprocessable_entity
        end 
    end

    def show
        render json:@rent, status: :ok
    end

    def destroy
        if @rent.destroy
            render json:{message: "Deleted"}, status: :ok
		end
    end 

    def all_apartments
        @rents = Rent.where(property_type: "Apartment")
        render json:@rents, status: :ok
    end

    def all_independents
        @rents = Rent.where(property_type: "Independent")
        render json:@rents, status: :ok
    end


    private

    #callbacks
    def find_rent  
        @rent = User.find_by!(username: params[:user__username]).rents.find(params[:id])
    end

    #params
    def rent_params
        params.permit(:about,:address,:price,:phone_no,:property_type,:landmark)
    end
end

