class CreatePrograms < ActiveRecord::Migration

  def self.up
    create_table :programs do |t|
      t.string :name,        :limit => 50,  :null => false
      t.string :description, :limit => 255, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :programs
  end

end
