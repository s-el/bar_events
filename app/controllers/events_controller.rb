class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    conditions = {}
    query = params[:keyword].presence || "*"

    if params[:location].present?
      latitude, longitude = Geocoder.coordinates(params[:location])

      conditions[:location] = { near: { lat: latitude, lon: longitude }, within: "5mi" }
    end

    if params[:date].present?
      date = Date.strptime(params[:date], "%m/%d/%Y")
      conditions[:date] = date
    end


    @search = Event.search(query, where: conditions)
    @events = @search.results

    if @events.blank?
      @events = Event.joins(:bar).where.not('bars.latitude IS NULL AND bars.longitude IS NULL')
    else
      @events
    end

        @hash = Gmaps4rails.build_markers(@events) do |event, marker|
          marker.lat event.bar.latitude
          marker.lng event.bar.longitude
          marker.infowindow render_to_string(partial: "/events/map_box", locals: { event: event })
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
    @bars = Bar.where(user: current_user)
  end

  def create
    @event = Event.new(event_params)
    @date = (params[:date])
    @bars = Bar.where(user: current_user)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event = Event.update(event_params)
    @event.save!
    redirect_to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:category, :title, :description, :date, :start_time, :end_time, :bar_id)
  end
end
