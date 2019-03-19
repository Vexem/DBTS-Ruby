module Api
  module V1
    class Api::V1::MedicinetouserController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]

      def index
        medicinetouser = Medicinetouser.all
        render json: { MtoU: medicinetouser }, status: :ok
      end

      def create
        medicinetouser = Medicinetouser.new(medicinetouser_param)

        if medicinetouser.save
          render json: medicinetouser, status: :created
        else
          render json: medicinetouser.errors, status: :unprocessable_entity
        end
      end

      def medicinetouser_param
        params.require(:medicinetouser).permit(:patient_id, :medicine_id)
      end
    end
  end
end