class CreateStationSnapshots < ActiveRecord::Migration
  def up
    create_table :station_snapshots do |t|
      t.references :station
      t.string :status
      t.integer :available_bike_count
      t.integer :available_dock_count
      t.datetime :created_at
    end
    
    add_index :station_snapshots, :status
  end

  def down
    drop_table :station_snapshots
  end
end
