class ArtworksController < ApplicationController

    def index
        if params.has_key?(:user_id)
            owned = Artwork.where(artist_id: params[:user_id])
        end

        if params.has_key?(:user_id)
            shared = ArtworkShare.where(viewer_id: params[:user_id])
        end

        render json: owned + shared
    end

    def create
        art = Artwork.new(art_params)

        if art.save
            redirect_to "/artworks/#{art.id}"
        else
            render json: art.errors.full_messages, status: 422
        end
    end

    def show
        art = Artwork.find(params[:id])

        render json: art
    end

    def update
        art = Artwork.find(params[:id])

        if art.update(art_params)
            redirect_to "/artworks/#{art.id}"
        else
            render json: art.errors.full_messages, status: 422
        end

    end

    def destroy
        art = Artwork.find(params[:id])

        art.destroy

        render json: art
    end

    private

    def art_params
        params.require(:art).permit(:title, :img_url, :artist_id)
    end #have to do with user input


end
