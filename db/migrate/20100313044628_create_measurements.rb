class CreateMeasurements < ActiveRecord::Migration

  def self.up
    create_table :measurements do |t|
      t.references :user
      t.date       :measure_date

      # size measurements
      t.integer    :weight
      t.string     :waist
      t.string     :wrist
      t.string     :chest
      t.string     :hip
      t.string     :bicep
      t.string     :forearm
      t.string     :thigh
      t.string     :calve
      t.string     :neck

      # fitness measurements
      t.integer    :resting_hr
      t.integer    :bp_systolic
      t.integer    :bp_diastolic
      t.integer    :v02_max

      t.timestamps
    end
  end

  def self.down
    drop_table :programs
  end

end
