class Api::V1::SubjectsController < ApplicationController
  before_action :set_subject, only: [:update, :destroy]
  has_scope :course

  def index
    @subjects = apply_scopes(Subject).all
    render json: @subjects, only: [:name], include: {courses: {only: [:name]}}
  end

  def create
    authorize Subject
    @subject = Subject.new(subject_params)
    if @subject.save
      render json: @subject, except: [:created_at, :updated_at, :id], status: :created
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  def update
    if @subject.update(subject_params)
      render json: @subject
    else
      render json: @subject.errors, except: [:created_at, :updated_at, :id], status: :unprocessable_entity
    end
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :course_id)
  end
end
