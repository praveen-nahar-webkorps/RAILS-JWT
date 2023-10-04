class LoansController < ApplicationController
    before_action :authorize_request
    
    def index
        @loans = Buy.find_by(id: params[:buy_id]).loans.all
        render json:@loans, status: :ok
    end

    def create
        @loan = Buy.find_by(id: params[:buy_id]).loans.new(loan_params)

        if @loan.save 
            render json:@loan, status: :ok
        else
            render json:{error: "unable to process"}, status: :unprocessable_entity
        end
    end

    def destroy
        @loan = Buy.find_by(id: params[:buy_id]).loans.find(params[:id])

        if @loan.destroy
            render json:{message: "Deleted"}, status: :ok
		end
    end 

    private

    def loan_params
        params.permit(:name,:details)
    end

end
