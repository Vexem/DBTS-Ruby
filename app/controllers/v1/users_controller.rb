# frozen_string_literal: true
class V1::BooksController < ApplicationController
  def index
    users = User.all
    render json: { users: users }, status: :ok
  end
end