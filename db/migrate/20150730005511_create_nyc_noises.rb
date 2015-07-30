class CreateNycNoises < ActiveRecord::Migration
  def change
    create_table :nyc_noises do |t|
      t.datetime :created_date
      t.datetime :closed_date
      t.string :complaint_type
      t.string :descriptor
      t.string :city
      t.string :borough
      t.decimal :latitude, {:precision=>10, :scale=>6}
      t.decimal :longitude, {:precision=>10, :scale=>6}
      t.integer :weight, default: 1
    end
  end
end
