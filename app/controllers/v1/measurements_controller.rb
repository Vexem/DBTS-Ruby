# frozen_string_literal: true
class V1::BooksController < ApplicationController
  def index
    measurements = Measurements.all
    render json: { measurements: measurements }, status: :ok
  end
end