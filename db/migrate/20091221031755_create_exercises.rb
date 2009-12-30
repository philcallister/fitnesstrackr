class CreateExercises < ActiveRecord::Migration

  def self.up
    create_table :exercises do |t|
      t.string :name, :limit => 50, :null => false
      t.string :description, :limit => 255, :null => false
      t.column :kind, :enum, :limit => [:cardio, :single, :strength]
      t.timestamps
    end
  end

  def self.down
    drop_table :exercises
  end

end
