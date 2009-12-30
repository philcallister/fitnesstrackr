# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091222023407) do

  create_table "cardio_plans", :force => true do |t|
    t.integer  "exercise_id"
    t.integer  "time",                                      :default => 0
    t.integer  "level",                                     :default => 0
    t.decimal  "incline",     :precision => 3, :scale => 1, :default => 0.0
    t.decimal  "speed",       :precision => 3, :scale => 1, :default => 0.0
    t.decimal  "distance",    :precision => 5, :scale => 2, :default => 0.0
    t.integer  "calories",                                  :default => 0
    t.integer  "min_hr",                                    :default => 0
    t.integer  "max_hr",                                    :default => 0
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cardios", :force => true do |t|
    t.integer  "exercise_id"
    t.integer  "time",                                      :default => 0
    t.integer  "level",                                     :default => 0
    t.decimal  "incline",     :precision => 3, :scale => 1, :default => 0.0
    t.decimal  "speed",       :precision => 3, :scale => 1, :default => 0.0
    t.decimal  "distance",    :precision => 5, :scale => 2, :default => 0.0
    t.integer  "calories",                                  :default => 0
    t.integer  "min_hr",                                    :default => 0
    t.integer  "max_hr",                                    :default => 0
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", :force => true do |t|
    t.string   "name",        :limit => 50,                            :null => false
    t.string   "description",                                          :null => false
    t.enum     "kind",        :limit => [:cardio, :single, :strength]
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises_workout_plans", :force => true do |t|
    t.integer "exercise_plan_id"
    t.string  "exercise_plan_type"
    t.integer "workout_plan_id"
    t.integer "position"
  end

  create_table "exercises_workouts", :force => true do |t|
    t.integer "exercise_id"
    t.string  "exercise_type"
    t.integer "workout_id"
    t.integer "position"
  end

  create_table "programs", :force => true do |t|
    t.string   "name",        :limit => 50, :null => false
    t.string   "description",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "single_plans", :force => true do |t|
    t.integer  "exercise_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "single_set_plans", :force => true do |t|
    t.integer "single_plan_id"
    t.integer "number",         :default => 0
  end

  create_table "single_sets", :force => true do |t|
    t.integer "single_id"
    t.integer "number",    :default => 0
  end

  create_table "singles", :force => true do |t|
    t.integer  "exercise_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "strength_plans", :force => true do |t|
    t.integer  "exercise_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "strength_set_plans", :force => true do |t|
    t.integer "strength_plan_id"
    t.integer "reps",             :default => 0
    t.integer "weight",           :default => 0
  end

  create_table "strength_sets", :force => true do |t|
    t.integer "strength_id"
    t.integer "reps",        :default => 0
    t.integer "weight",      :default => 0
  end

  create_table "strengths", :force => true do |t|
    t.integer  "exercise_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workout_plans", :force => true do |t|
    t.integer  "program_id"
    t.string   "name",        :limit => 50, :null => false
    t.string   "description",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workouts", :force => true do |t|
    t.integer  "workout_plan_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
