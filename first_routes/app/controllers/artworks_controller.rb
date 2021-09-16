class ArtworksController < ApplicationController
    def index 
        if params.has_key?(:user_id)
            art = Artwork.where(artist_id: params[:user_id])
            art_shared = ArtworkShare.where(viewer_id: params[:user_id])
            arr = []
            art_shared.each do |ele|
                arr << ele.artwork_id
            end
            art += Artwork.where(artist_id: arr)
            render json: art
        end
    end

    def create
        artwork = Artwork.new(artwork_params)
        # replace the `Artwork_attributes_here` with the actual attribute keys
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show

        render json: Artwork.find(params[:id])
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :img_url, :artist_id)
    end

end