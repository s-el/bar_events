class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
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
    redirect_to bar_path(@bar)
  end

  private

  def bar_params
    params.require(:bar).permit(:name, :location, :description, :website, :user_id)
  end
end
