class Station < ActiveRecord::Base
  has_paper_trail
  
  validates :citibike_station_id, presence: true, numericality: { integer_only: true, greater_than: 0 }
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
  
  has_many :snapshots, class_name: 'StationSnapshot'
  
  # delegate to the current snapshot for status info
  delegate :status, :available_bike_count, :available_dock_count, :to => :current_snapshot, :allow_nil => true
  
  def current_snapshot
    @current_snapshot ||= snapshots.last
  end  
end