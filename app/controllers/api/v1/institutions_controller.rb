class Api::V1::InstitutionsController < ApplicationController
  before_action :set_institution, only: [:destroy, :update]

  def index
    @institutions = Institution.all
    render json: @institutions, only: [:name, :id]
  end

  def create
    @institution = Institution.new(institution_params)
    if @institution.save
      render json: @institution, except: [:created_at, :updated_at]
    else
      render json: @institution.errors, status: :unprocessable_entity
    end
  end

  def update
    if @institution.update(institution_params)
      render json: @institution
    else
      render json: @institution.errors, except: [:created_at, :updated_at, :id], status: :unprocessable_entity
    end
  end

  private

  def institution_params
    params.require(:institution).permit(:name)
  end

  def set_institution
    @institution = Institution.find(params[:id])
  end
end
