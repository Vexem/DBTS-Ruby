module Api
  module V1
    class Api::V1:: UsersController < BaseController
      def index
        users = User.all
        render json: { users: users }, status: :ok
      end

      def create
        users = User.new(user_params)
        if users.save
          render json: users, status: :created
        else
          render json: users.errors, status: :unprocessable_entity
        end
      end

      def userbyid
        user_id = params[:user_id]
        user = User.where(user_id: user_id)
        render json: user
      end

      def user_params
        params.require(:user).permit(:user_id,
                                     :provider,
                                     :medic_id,
                                     :first_name,
                                     :last_name,
                                     :username,
                                     :email,
                                     :oauth_token,
                                     :oauth_expires_at
                                      )
      end
    end
  end
end