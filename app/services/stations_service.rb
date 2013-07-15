class StationsService
  include HTTParty
  base_uri 'http://appservices.citibikenyc.com'
  
  def fetch_station_data
    Rails.logger.info 'Fetching station snapshots...'
    self.class.get('/data2/stations.php')
  end
  
  def ingest_station_snapshots
    response = fetch_station_data
    last_update = response['lastUpdate']
    last_update_captured = StationSummary.last_update
    
    if last_update <= last_update_captured.to_i
      Rails.logger.info "last_update timestamp in response (#{last_update}) is not newer than the last captured timestamp #{last_update_captured}"
      return
    end
    
    summary = StationSummary.new
    summary.active_stations = response['activeStations']
    summary.total_stations = response['totalStations']
    summary.last_update = last_update
    summary.save!
    
    response['results'].each do |result|
      station = Station.find_by_citibike_station_id(result['id']) || Station.new
      station.citibike_station_id = result['id']
      station.latitude = result['latitude']
      station.longitude = result['longitude']
      station.label = result['label']
      station.address = result['stationAddress']
      if station.new_record? && station.save!
        StationsMailer.new_station(station).deliver
      end
      
      snap = StationSnapshot.new
      snap.station = station
      snap.station_summary = summary
      snap.status = result['status']
      snap.available_bike_count = result['availableBikes']
      snap.available_dock_count = result['availableDocks']
      snap.save!
    end
  end 
end