class CreateStrengthSets < ActiveRecord::Migration

  def self.up
    create_table :strength_sets do |t|
      t.references :strength
      t.integer :reps, :default => 0
      t.integer :weight, :default => 0
    end
  end

  def self.down
    drop_table :strength_sets
  end

end
