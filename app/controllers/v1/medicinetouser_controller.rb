# frozen_string_literal: true
class V1::BooksController < ApplicationController
  def index
    medicinetouser = Medicinetouser.all
    render json: { medicinetouser: medicinetouser }, status: :ok
  end
end