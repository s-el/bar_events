class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = Event.joins(:bar).where.not('bars.latitude IS NULL AND bars.longitude IS NULL')
    if params[:keyword]
      @events = Event.where('category LIKE ?', "%#{params[:keyword]}%").all
    end

    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.bar.latitude
      marker.lng event.bar.longitude
      # marker.infowindow render_to_string(partial: "/events/map_box", locals: { event: event })
    end
  end

  def show
    @event = Event.find(params[:id])
    @event_coordinates = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.bar.latitude
      marker.lng event.bar.longitude
    end
  end

  def new
    @event = Event.new()
  end

  private

  def event_params
    params.require(:bar).permit(:category, :title, :description, :date,
    :start_time, :end_time, :bar_id)
  end
end
