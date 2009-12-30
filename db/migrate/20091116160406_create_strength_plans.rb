class CreateStrengthPlans < ActiveRecord::Migration

  def self.up
    create_table :strength_plans do |t|
      t.references :exercise
      t.string :notes, :limit => 255, :null => true
      
      t.timestamps
    end
  end

  def self.down
    drop_table :strength_plans
  end
  
end
