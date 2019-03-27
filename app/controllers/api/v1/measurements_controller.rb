module Api
  module V1
    class Api::V1:: MeasurementsController < BaseController

      def show
      end
      # GET api/v1/measurements
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

      #http://192.168.1.5/measurements/getmeasurementbyuid?patient_id=1
      def getmeasurementbyuid
        patient_id = params[:patient_id]
        measurements = Measurement.where(patient_id: patient_id)
        render json: { measurements: measurements }, status: :ok
      end

      def measurement_param
        params.require(:measurement).permit(:patient_id,
                                            :value,
                                            :created_at)
      end
    end
  end
end