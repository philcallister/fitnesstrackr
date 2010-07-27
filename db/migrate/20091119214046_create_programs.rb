class CreatePrograms < ActiveRecord::Migration

  def self.up
    create_table :programs do |t|
      t.references :user
      t.string     :name,        :limit => 50,  :null => false
      t.string     :description, :limit => 500, :null => false
      t.date       :start_date

      t.timestamps
    end
  end

  def self.down
    drop_table :programs
  end

end
