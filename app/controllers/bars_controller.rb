class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bars = Bar.where.not('latitude IS NULL AND longitude IS NULL')
    @hash = Gmaps4rails.build_markers(@bars) do |bar, marker|
      marker.lat bar.latitude
      marker.lng bar.longitude
      # marker.infowindow render_to_string(partial: "/events/map_box", locals: { event: event })
    end
  end

  def show
    @bar = Bar.find(params[:id])
     @bar_coordinates = Gmaps4rails.build_markers(@bar) do |bar, marker|
      marker.lat bar.latitude
      marker.lng bar.longitude
    end
  end

  def new
    @bar = Bar.new()
  end

  def create
    @bar = Bar.new(bar_params)
    @bar.user = current_user
    @bar.save
    redirect_to bar_path(@bar)
  end

  def edit
    @bar = Bar.find(bar_params[:id])
  end

  def update
    @bar = Bar.find(bar_params[:id])
    @bar.update(bar_params)
    @bar.save!
    redirect_to bar_path(@bar)
  end

  private

  def bar_params
    params.require(:bar).permit(:name, :location, :description, :website, :user_id)
  end
end
