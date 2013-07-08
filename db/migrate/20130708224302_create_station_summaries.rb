class CreateStationSummaries < ActiveRecord::Migration
  def up
    create_table :station_summaries do |t|
      t.integer :active_stations
      t.integer :total_stations
      t.timestamps
    end

    add_column :station_summaries, :last_update, :bigint
    add_index :station_summaries, :last_update
  end

  def down
    drop_table :station_summaries
  end
end
