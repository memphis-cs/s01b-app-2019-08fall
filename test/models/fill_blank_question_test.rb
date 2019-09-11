# == Schema Information
#
# Table name: questions
#
#  id           :bigint           not null, primary key
#  answer       :string
#  distractor_1 :string
#  distractor_2 :string
#  question     :string
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  quiz_id      :bigint
#
# Indexes
#
#  index_questions_on_quiz_id  (quiz_id)
#
# Foreign Keys
#
#  fk_rails_...  (quiz_id => quizzes.id)
#

require 'test_helper'

class FillBlankQuestionTest < ActiveSupport::TestCase
  test "fill blank question should be valid" do
    one = questions(:one)
    assert one.valid?, one.errors.full_messages.inspect
  end

  test "question must be present" do
    one = questions(:one)
    one.question = nil
    assert_not one.valid?, one.errors.full_messages.inspect
    assert one.errors.count == 1, one.errors.full_messages.inspect
    assert one.errors.of_kind?(:question, :blank), one.errors.full_messages.inspect
  end

  test "answer must be present" do
    one = questions(:one)
    one.answer = nil
    assert_not one.valid?, one.errors.full_messages.inspect
    assert one.errors.count == 1, one.errors.full_messages.inspect
    assert one.errors.of_kind?(:answer, :blank), one.errors.full_messages.inspect
  end
end
