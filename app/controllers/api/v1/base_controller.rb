module Api
  module V1
    class BaseController < ApplicationController
      include ::ActionController::Serialization
    end
  end
end