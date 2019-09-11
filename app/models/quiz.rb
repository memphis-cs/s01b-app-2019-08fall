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

class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
end
