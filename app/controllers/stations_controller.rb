class StationsController < ApplicationController
  def index
    @stations = Station.unscoped
  end
end