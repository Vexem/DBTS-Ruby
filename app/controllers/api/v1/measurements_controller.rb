module Api
  module V1
    class Api::V1::MeasurementsController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]

      # GET api/v1/users
      def index
        measurements = Measurement.all
        render json: { measurements: measurements }, status: :ok
      end

      def create
        measurements = Measurement.new(measurement_param)

        if measurements.save
          render json: measurements, status: :created
        else
          render json: measurements.errors, status: :unprocessable_entity
        end
      end

      def measurement_param
        params.require(:measurement).permit(:patient_id, :value ,:created_at)
      end
    end
  end
end