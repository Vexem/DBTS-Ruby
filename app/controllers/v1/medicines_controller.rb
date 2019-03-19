# frozen_string_literal: true
class V1::BooksController < ApplicationController
  def index
    medicines = Medicines.all
    render json: { medicines: medicines }, status: :ok
  end
end