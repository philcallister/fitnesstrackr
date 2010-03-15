class CreateMeasurements < ActiveRecord::Migration

  def self.up
    create_table :measurements do |t|
      t.references :user
      t.date       :measure_date
      t.integer    :weight
      t.string     :bmi
      t.integer    :v02_max

      t.timestamps
    end
  end

  def self.down
    drop_table :programs
  end

end
