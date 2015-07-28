class AddDateTimeToNycNoises < ActiveRecord::Migration
  def up
    remove_column :nyc_noises, :created_date
    add_column :nyc_noises, :created_date, :datetime
  end

  def down
    remove_column :nyc_noises, :created_date
    add_column :nyc_noises, :created_date, :time
  end
end
