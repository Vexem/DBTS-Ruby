module Api
  module V1
    class  Api::V1::SessionsController < ApplicationController
      def create
        user = User.from_omniauth(env["omniauth.auth"])
        session[:user_id] = user.id
        redirect_to root_path
      end

      def destroy
        session[:user_id] = nil
        redirect_to root_path
      end
    end
  end
end