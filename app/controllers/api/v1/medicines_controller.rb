module Api
  module V1
    class Api::V1::  MedicinesController < BaseController

      # GET api/v1/users
      def index
        medicines = Medicine.all
        render json: { medicines: medicines }, status: :ok
      end

      def create
        medicines = Medicine.new(medicine_param)

        if medicines.save
          render json: medicines, status: :created
        else
          render json: medicines.errors, status: :unprocessable_entity
        end
      end

      def medicine_param
        params.require(:medicine).permit(:medicine_name,
                                         :medicine_id,
                                         :created_at,
                                         :updated_at
                                          )
      end
    end
  end
end