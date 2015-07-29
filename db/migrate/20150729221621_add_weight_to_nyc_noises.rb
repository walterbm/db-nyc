class AddWeightToNycNoises < ActiveRecord::Migration
  def change
    add_column(:nyc_noises, :weight, :integer)
  end
end
