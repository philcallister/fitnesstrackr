class CreateSingleSets < ActiveRecord::Migration

  def self.up
    create_table :single_sets do |t|
      t.references :single
      t.integer :number, :default => 0
    end
  end

  def self.down
    drop_table :single_sets
  end

end
