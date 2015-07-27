class NycNoiseComplaints < ActiveRecord::Migration
  def change
    create_table :nyc_noise_complaints do |t|
      t.integer :unique_key
      t.dateTime :created_date
      t.dateTime :closed_date
      t.string :agency
      t.string :complaint_type
      t.string :descriptor
      t.string :location_type
      t.string :incident_zip
      t.string :incident_address
      t.string :city
      t.string :borough
      t.float :latitude
      t.float :longitude
      t.string :location
    end
  end
end
