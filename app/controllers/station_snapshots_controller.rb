class StationSnapshotsController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
    @snapshots = @station.snapshots.order('id DESC')
  end
end
