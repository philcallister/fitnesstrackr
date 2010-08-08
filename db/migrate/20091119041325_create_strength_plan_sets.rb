class CreateStrengthPlanSets < ActiveRecord::Migration

  def self.up
    create_table :strength_plan_sets do |t|
      t.references :strength_plan
      t.integer :reps, :default => 0
      t.integer :weight, :default => 0
      t.integer :strength_plan_set_position
      t.boolean :completed,   :default => false

      # Parameter for actual sets
      t.integer :actual_reps, :default => 0
      t.integer :actual_weight, :default => 0

    end
  end

  def self.down
    drop_table :strength_plan_sets
  end

end
