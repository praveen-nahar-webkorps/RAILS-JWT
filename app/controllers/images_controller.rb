class ImagesController < ApplicationController
    before_action :fetch_type, only: [:create,:index,:destroy]

    def index
        @image_type = fetch_type
        @images =  @image_type.images.all
        render json:@images, status: :ok
    end 

    def create
        @image_type = fetch_type
        @image = @image_type.images.build(image_params)

        if @image.save 
            render json:{message: "Uploaded Successfully"}, status: :created
        else
            render json:{error: "Unable to Upload"}, status: :unprocessable_entity
        end
    end

    def destroy
        @image_type = fetch_type
        @image = @image_type.images.find(params[:id])
  
        if @image.destroy 
          render json:{message: "Deleted successfully"}, status: :ok
        else
          render json:{error: "Unable to Delete"}, status: :ok
        end
    end

    private

    def fetch_type
        if params[:buy_id]
            Buy.find(params[:buy_id])
        elsif params[:rent_id]
            Rent.find(params[:rent_id])
        end
    end

    def image_params
        params.permit(:profile_img)
    end

end