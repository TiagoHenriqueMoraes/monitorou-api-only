module Api::V1
  class EventsController < ApiController
    before_action :set_event, only: [:update, :destroy]
    before_action :authorize_user, only: %i[create update destroy]

    def index
      @events = apply_scopes(Event).all
      render json: @events, except: [:created_at, :updated_at], include: {courses_subject: {only: [:id],
                                                                            include: {subject: {only: [:name]},
                                                                                       course: {only: [:name]}}}}
    end

    def create
      @event = Event.new(event_params)
      if @event.save
        render json: @event
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end

    def update
      if @event.update(event_params)
        render json: @event
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @event.destroy
    end

    private
  
    def authorize_user
      authorize Event
    end

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:description, :date, :courses_subject_id)
    end

  end
end