namespace 'ingestion' do
  task 'ingest_station_snapshots' => :environment do
    service = StationsService.new
    service.ingest_station_snapshots
  end
end