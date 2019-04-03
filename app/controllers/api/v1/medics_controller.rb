module Api
  module V1
    class Api::V1:: MedicsController < BaseController

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

      def medicbyid
        medic_id = params[:medic_id]
        medic = Medic.where(medic_id: medic_id)
        render json: { medic: medic }, status: :ok
      end

      def medic_param
        params.require(:medic).permit(:medic_id,
                                      :medic_name,
                                      :medic_mail,
                                      :medic_hospital,
                                      :created_at,
                                      :updated_at
                                      )
      end
    end
  end
end