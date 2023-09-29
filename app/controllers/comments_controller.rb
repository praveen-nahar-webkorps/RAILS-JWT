class CommentsController < ApplicationController
    before_action :fetch_type, only: [:create]
  
    def create
      @comment_type = fetch_type
      @comment = @comment_type.comments.build(comment_params)
  
      if @comment.save
        render json: @comment, status: :created
      else
        render json: @comment.errors, status: :unprocessable_entity
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
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  