class CreateSinglePlanSets < ActiveRecord::Migration

  def self.up
    create_table :single_plan_sets do |t|
      t.references :single_plan
      t.integer :number, :default => 0
      t.boolean :completed,   :default => false

      # Parameter for actual sets
      t.integer :actual_number, :default => 0

    end
  end

  def self.down
    drop_table :single_plan_sets
  end

end
