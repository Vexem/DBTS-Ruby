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

      def getlastmeasurementbyid
        patient_id = params[:patient_id]
        measurements = Measurement.where(patient_id: patient_id)
        ordered_measurements = measurements.order("created_at DESC").first
                                   # .having('created_at = MAX(created_at)')
        render json: { last_measurement: ordered_measurements }, status: :ok
      end

      def getlastmeasurementorderdbyid
        patient_id = params[:patient_id]
        measurements = Measurement.where(patient_id: patient_id)
        ordered_measurements = measurements.order("created_at DESC").where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
        render json: { last_measurements: ordered_measurements }, status: :ok
      end

      def getdailyvalues
        patient_id = params[:patient_id]
        measurements = Measurement.where(patient_id: patient_id)
        daily_measurements = measurements.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
        # .having('created_at = MAX(created_at)')
        render json: { daily_measurements: daily_measurements }, status: :ok

        # .all(:conditions => { :created_at => (Time.now.midnight - 1.day)..Time.now.midnight})
      end

      def measurement_param
        params.require(:measurement).permit(:patient_id,
                                            :value,
                                            :created_at)
      end
    end
  end
end