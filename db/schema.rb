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

ActiveRecord::Schema.define(:version => 20100313044628) do

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
    t.string   "name",        :limit => 50, :null => false
    t.string   "description",               :null => false
    t.integer  "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises_workout_plans", :force => true do |t|
    t.integer "exercise_plan_id"
    t.string  "exercise_plan_type"
    t.integer "workout_plan_id"
    t.integer "exercise_workout_plan_position"
  end

  create_table "exercises_workouts", :force => true do |t|
    t.integer "exercise_id"
    t.string  "exercise_type"
    t.integer "workout_id"
    t.integer "exercise_workout_position"
  end

  create_table "measurements", :force => true do |t|
    t.integer  "user_id"
    t.date     "measure_date"
    t.integer  "weight"
    t.string   "waist"
    t.string   "wrist"
    t.string   "chest"
    t.string   "hip"
    t.string   "bicep"
    t.string   "forearm"
    t.string   "thigh"
    t.string   "calve"
    t.string   "neck"
    t.integer  "resting_hr"
    t.integer  "bp_systolic"
    t.integer  "bp_diastolic"
    t.integer  "v02_max"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", :force => true do |t|
    t.integer  "user_id"
    t.string   "name",        :limit => 50,  :null => false
    t.string   "description", :limit => 500, :null => false
    t.date     "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "single_plan_sets", :force => true do |t|
    t.integer "single_plan_id"
    t.integer "number",         :default => 0
  end

  create_table "single_plans", :force => true do |t|
    t.integer  "exercise_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "strength_plan_sets", :force => true do |t|
    t.integer "strength_plan_id"
    t.integer "reps",             :default => 0
    t.integer "weight",           :default => 0
  end

  create_table "strength_plans", :force => true do |t|
    t.integer  "exercise_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "users", :force => true do |t|
    t.string   "login",                                             :null => false
    t.string   "email",                                             :null => false
    t.string   "crypted_password",                                  :null => false
    t.string   "password_salt",                                     :null => false
    t.string   "persistence_token",                                 :null => false
    t.string   "single_access_token",                               :null => false
    t.string   "perishable_token",                                  :null => false
    t.integer  "login_count",                        :default => 0, :null => false
    t.integer  "failed_login_count",                 :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.integer  "gender"
    t.date     "birthday"
    t.integer  "height"
    t.string   "goal",                :limit => 100
    t.date     "goal_start_date"
    t.date     "goal_end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workout_blocks", :force => true do |t|
    t.integer  "program_id"
    t.string   "name",                   :limit => 50, :null => false
    t.string   "description",                          :null => false
    t.integer  "workout_block_position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workout_plans", :force => true do |t|
    t.integer  "workout_block_id"
    t.string   "name",                  :limit => 50, :null => false
    t.string   "description",                         :null => false
    t.integer  "workout_plan_position"
    t.boolean  "has_pt",                              :null => false
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
