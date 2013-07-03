class CreateStations < ActiveRecord::Migration
  def up
    create_table :stations do |t|
      t.integer :citibike_station_id
      t.decimal :latitude, precision: 24, scale: 20 # probably overkill
      t.decimal :longitude, precision: 24, scale: 20
      t.string :label
      t.string :address
      t.timestamps
    end
    
    add_index :stations,  :citibike_station_id
    add_index :stations,  :latitude
    add_index :stations,  :longitude
  end

  def down
    drop_table :stations
  end
end
