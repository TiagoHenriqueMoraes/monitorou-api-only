  module Api::V1
    class AttendancesController < ApiController
      before_action :set_attendance, only: [:update, :destroy]
  
      def index
        @attendances = apply_scopes(Attendance).all
        render json: @attendances, except: [:created_at, :updated_at], include: {user: {only: [:id, :name],
                                                                                  include: {course: {only: [:name]}}}}
      end
  
      def create
        @attendance = Attendance.new(attendance_params)
        if @attendance.save
          render json: @attendance
        else
          render json: @attendance.errors, status: :unprocessable_entity
        end
      end
  
      def update
        if @attendance.update(attendance_params)
          render json: @attendance
        else
          render json: @attendance.errors, status: :unprocessable_entity
        end
      end
  
      def destroy
        @attendance.destroy
      end
  
      private
  
      def set_attendance
        @attendance = Attendance.find(params[:id])
      end
  
      def attendance_params
        params.require(:attendance).permit(:user_id, :kind, :date)
      end
  
    end
  end