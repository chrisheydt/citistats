class StationsService
  include HTTParty
  base_uri 'http://appservices.citibikenyc.com'
  
  def fetch_station_data
    self.class.get('/data2/stations.php')
  end
  
  def ingest_station_snapshots
    response = fetch_station_data
    response['results'].each do |result|
      station = Station.find_by_citibike_station_id(result['id']) || Station.new
      station.citibike_station_id = result['id']
      station.latitude = result['latitude']
      station.longitude = result['longitude']
      station.label = result['label']
      station.address = result['stationAddress']
      station.save!
      
      snap = StationSnapshot.new
      snap.station = station
      snap.status = result['status']
      snap.available_bike_count = result['availableBikes']
      snap.available_dock_count = result['availableDocks']
      snap.save!
    end
  end 
end