class AddStationSummaryIdToStationSummaries < ActiveRecord::Migration
  def change
    add_column :station_snapshots, :station_summary_id, :integer
    add_index :station_snapshots, :station_summary_id
  end
end
