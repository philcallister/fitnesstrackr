class CreateExerciseTypes < ActiveRecord::Migration

  def self.up
    create_table :exercise_types do |t|
      t.string :name, :limit => 50, :null => false
      t.string :description, :limit => 255, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :exercise_types
  end

end
