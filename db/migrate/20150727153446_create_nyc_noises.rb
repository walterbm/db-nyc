class CreateNycNoises < ActiveRecord::Migration
  def change
    create_table :nyc_noises do |t|
      t.integer :unique_key
      t.datetime :created_date
      t.datetime :closed_date
      t.string :agency
      t.string :complaint_type
      t.string :descriptor
      t.string :location_type
      t.string :incident_zip
      t.string :incident_address
      t.string :city
      t.string :borough
      t.decimal :latitude, {:precision=>10, :scale=>6}
      t.decimal :longitude, {:precision=>10, :scale=>6}
      t.string :location
      t.timestamps null: false
    end
  end
end
