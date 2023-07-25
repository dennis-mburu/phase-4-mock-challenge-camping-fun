class SignupsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid

  def create
    signup = Signup.create!(signup_params)
    render json: signup.activity, status: 201
  end

  private

  def signup_params
    params.permit(:time, :camper_id, :activity_id)
  end

  def render_record_invalid(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: 422
  end
end
