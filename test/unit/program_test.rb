# == Schema Information
#
# Table name: programs
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  name        :string(50)      not null
#  description :string(500)     not null
#  start_date  :date
#  completed   :boolean(1)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class ProgramTest < ActiveSupport::TestCase

  # Validations
  should_validate_presence_of :name, :description
  should_ensure_length_in_range :name, 1..50
  should_ensure_length_in_range :description, 1..500
  should_not_allow_values_for :name, nil
  should_not_allow_values_for :description, nil

  # Associations
  should_belong_to :user
  should_have_many :workout_blocks
  
  ##############################################################################
  # Adding
  context "A new program" do
    should "be added" do
      assert_save(Program.make_unsaved)
    end
  end

  ##############################################################################
  # Associations
  context "An existing program" do
    setup do
      @program = Program.make do |program|
        3.times { program.workout_blocks.make }
      end
    end
    context "with workout blocks" do
      should "have 3 workout blocks" do
        assert_equal 3, @program.workout_blocks.length
      end
      should "have a new workout bloock added" do
        @program.workout_blocks << WorkoutBlock.make(:program => nil)
        assert_equal 4, @program.workout_blocks.length
      end
      should "delete all workout blocks" do
        workout_blocks = @program.workout_blocks
        @program.destroy
        workout_blocks.each do |wb|
          deleted_workout_block = WorkoutBlock.find(wb.id)
          assert_nil deleted_workout_block
        end
      end
    end
  end

end
