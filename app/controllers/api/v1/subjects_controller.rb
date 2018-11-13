class Api::V1::SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
    render json: @subjects, only: [:name], :include => {:course => {:only => :name}}
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      render json: @subject, except: [:created_at, :updated_at, :id], status: :created
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :course_id)
  end
end
