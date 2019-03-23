module Api
  module V1
    class Api::V1::UsersController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]

      # GET api/v1/users
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

      def user_params
        params.require(:user).permit(:uid, :name, :medic_name, :patient_id, :surname)
      end
    end
  end
end