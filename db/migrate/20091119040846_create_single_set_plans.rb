class CreateSingleSetPlans < ActiveRecord::Migration

  def self.up
    create_table :single_set_plans do |t|
      t.references :single_plan
      t.integer :number, :default => 0
    end
  end

  def self.down
    drop_table :single_set_plans
  end

end
