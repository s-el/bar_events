class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @bars = Bar.where(user: current_user)

    @events = []

    @bars.each do |bar|
      bar.events.each do |event|
        @events << event
      end
    end
  end
end
