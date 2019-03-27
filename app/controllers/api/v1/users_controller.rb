module Api
  module V1
    class UsersController < BaseController
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
        params.require(:user).permit(:uid, :name, :medic_id, :patient_id, :surname)
      end
    end
  end
end