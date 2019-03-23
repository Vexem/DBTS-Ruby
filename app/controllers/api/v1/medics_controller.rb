module Api
  module V1
    class Api::V1::MedicsController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]

      # GET api/v1/users
      def index
        medics = Medic.all
        render json: { medics: medics }, status: :ok
      end

      def create
        medics = Medic.new(medic_param)

        if medics.save
          render json: medics, status: :created
        else
          render json: medics.errors, status: :unprocessable_entity
        end
      end

      def medic_param
        params.require(:medic).permit(:medic_name, :medic_mail, :medic_hospital)
      end
    end
  end
end