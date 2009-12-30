class CreateCardioPlans < ActiveRecord::Migration

  def self.up
    create_table :cardio_plans do |t|
      t.references :exercise
      t.integer :time, :default => 0
      t.integer :level, :default => 0
      t.decimal :incline, :precision => 3, :scale => 1, :default => 0
      t.decimal :speed, :precision => 3, :scale => 1, :default => 0
      t.decimal :distance, :precision => 5, :scale => 2, :default => 0
      t.integer :calories, :default => 0
      t.integer :min_hr, :default => 0
      t.integer :max_hr, :default => 0
      t.string :notes, :limit => 255, :null => true

      t.timestamps
    end
  end

  def self.down
    drop_table :cardio_plans
  end
  
end
