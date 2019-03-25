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
        measurements = Measurement.new(meas_param)

        if measurements.save
          render json: measurements, status: :created
        else
          render json: measurements.errors, status: :unprocessable_entity
        end
      end

      #http://192.168.1.5/api/v1/measurements?patient_id=1
      def getmeasurementbyuid
          patient_id = params[:patient_id]
          measuremnts = []
          Measurement.find_by_[patient_id]
          render json: measuremnts
      end

      def meas_param
        params.require(:measurement).permit(:measurement, :patient_id)
      end
    end
  end
end