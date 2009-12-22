class CreateStrengthSetPlans < ActiveRecord::Migration

  def self.up
    create_table :strength_set_plans do |t|
      t.references :strength_plan
      t.integer :reps, :default => 0
      t.integer :weight, :default => 0
    end
  end

  def self.down
    drop_table :strength_set_plans
  end

end
