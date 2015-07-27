class ChangeColumnOnNycNoises < ActiveRecord::Migration
  change_table :nyc_noises do |t|
    t.change :created_date, :string
    t.change :closed_date, :string
  end
end
