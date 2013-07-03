class CreateStationProximities < ActiveRecord::Migration
  def up
    create_table :station_proximities do |t|
      t.references :station
      t.references :nearby_station
      t.decimal :distance, precision: 24, scale: 20
      t.timestamps
    end
    
    add_index :station_proximities, :station_id
    add_index :station_proximities, :nearby_station_id
  end

  def down
    drop_table :station_proximities
  end
end
