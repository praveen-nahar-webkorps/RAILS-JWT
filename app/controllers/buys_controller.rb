class BuysController < ApplicationController
    before_action :authorize_request
    before_action :find_buy, only: [:update,:show,:destroy]
  
    def index
        @buys = User.find_by!(username: params[:user__username]).buys.all
        render json:@buys, status: :ok
    end

    def create
        @buy = User.find_by!(username: params[:user__username]).buys.new(buy_params)
        
        if @buy.save
            render json: @buy, status: :created
        else
            render json: { errors: @buy.errors.full_messages },
                   status: :unprocessable_entity
        end
    end

    def update
        unless @buy.update(user_params)
            render json: { errors: @buy.errors.full_messages },
                   status: :unprocessable_entity
        end 
    end

    def show
         render json:@buy, status: :ok
    end

    def destroy
        if @buy.destroy
            render json:{message: "Deleted"}, status: :ok
		end
    end 

    def all_apartments
        @buys = Buy.where(property_type: "Apartment")
        render json:@buys, status: :ok
    end

    def all_independents
        @buys = Buy.where(property_type: "Independent")
        render json:@buys, status: :ok
    end


    private

    #callbacks
    def find_buy  
        @buy = User.find_by!(username: params[:user__username]).buys.find(params[:id])
    end

    #params
    def buy_params
        params.permit(:about,:address,:price,:phone_no,:property_type,:landmark,:buy_img)
    end
end
