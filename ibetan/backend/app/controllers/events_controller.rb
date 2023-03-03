class EventsController < ApplicationController
    def index
        render json: Event.all
    end

    def show
        render json: Event.find(params[:id])
    end

    def create
        event = Event.new(event_params)
        if event.save
            render json: event, status: :ok
        else
            render json: event.errors, status: :bad_request
        end
    end

    def update
        event = Event.find(params[:id])
        if event.update(event_params)
            render json: event, status: :ok
        else
            render json: event.errors, status: :bad_request
        end
    end

    def destroy
        event = Event.find(params[:id])
        event.destroy!
        render jsom: event
    end

    private
    def event_params
        params.require(:event).permit(:id, :name, :start, :end, :timed, :description, :color)
    end
end
