class StationSnapshot < ActiveRecord::Base
  validates :status, presence: true
  validates :available_bike_count, presence: true, numericality: { integer_only: true, greater_than_or_equal_to: 0 }
  validates :available_dock_count, presence: true, numericality: { integer_only: true, greater_than_or_equal_to: 0 }
  belongs_to :station
  belongs_to :station_summary
end