class ArtworkSharesController < ApplicationController
    
    def index
        shares = ArtworkShare.all

        render json: shares
    end
    
    def create
        share = ArtworkShare.new(artwork_share_params)

        if share.save
            render json: share
        else
            render json: share.errors.full_messages, status: 422
        end
    end

    # def show
    #     share = ArtworkShare.new(params[:id])

    #     render json: share
    # end

    def destroy
        share = ArtworkShare.find(params[:id])

        share.destroy

        render json: share
    end
    
    private

    def artwork_share_params
        params.require(:shares).permit(:artwork_id, :viewer_id)
    end
    
end