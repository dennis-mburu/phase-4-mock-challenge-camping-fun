class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid

  def index
    render json: Camper.all
  end

  def show
    render json: Camper.find(params[:id]), serializer: SingleCamperSerializer
  end

  def create
    camper = Camper.create!(camper_params)
    render json: camper, status: 201
  end

  private

  def render_record_not_found
    render json: { error: "Camper not found" }, status: 404
  end

  def camper_params
    params.permit(:name, :age)
  end

  def render_record_invalid(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: 422
  end
end
