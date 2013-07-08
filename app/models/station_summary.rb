class StationSummary < ActiveRecord::Base
  validates :active_stations, numericality: { greater_than_or_equal_to: 0 }
  validates :total_stations, numericality: { greater_than_or_equal_to: 0 }
  validates :last_update, numericality: { greater_than: 0 }
  
  has_many :snapshots, class_name: 'StationSnapshot'
  
  def self.last_update
    self.order('last_update DESC').limit(1).pluck(:last_update).first
  end
end