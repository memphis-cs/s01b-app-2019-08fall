# == Schema Information
#
# Table name: quizzes
#
#  id              :bigint           not null, primary key
#  description     :text
#  questions_count :integer
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint
#
# Indexes
#
#  index_quizzes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class QuizTest < ActiveSupport::TestCase
  test "quiz should be valid" do
    quiz = quizzes(:one)
    assert quiz.valid?, quiz.errors.full_messages.inspect
  end

  test "title must be present" do
    quiz = quizzes(:one)
    quiz.title = nil
    assert_not quiz.valid?, quiz.errors.full_messages.inspect
    assert quiz.errors.count == 1, quiz.errors.full_messages.inspect
    assert quiz.errors.of_kind?(:title, :blank), quiz.errors.full_messages.inspect
  end

  test "quiz with no questions should be valid" do
    quiz = quizzes(:two)
    assert quiz.valid?, quiz.errors.full_messages.inspect
  end

  test "quiz must have parent user" do
    quiz = quizzes(:one)
    quiz.user = nil
    assert_not quiz.valid?, quiz.errors.full_messages.inspect
    assert quiz.errors.count == 1, quiz.errors.full_messages.inspect
    assert quiz.errors.of_kind?(:user, "must exist"), quiz.errors.full_messages.inspect
  end

end
