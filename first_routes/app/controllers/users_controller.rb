class UsersController < ApplicationController
    def index
        if params[:query]
            wildstring = params[:query]
            user = User.where('username LIKE ?', "%#{wildstring}%" )
            render json: user
        else
            render json: User.all
        end
    end

    def create
        user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show

        render json: User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end

end