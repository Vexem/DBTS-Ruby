module Api
  module V1
    class Api::V1::UsersController < ApplicationController
      before_action :userbyid, only: [:show, :edit, :update, :destroy]
      # GET api/v1/users
      #
      def show
      end
      def index
        users = User.all
        render json: { users: users }, status: :ok
      end

      def saveuser
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