# == Schema Information
#
# Table name: questions
#
#  id             :integer          not null, primary key
#  title          :string
#  description    :text
#  problem_set_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Question < ActiveRecord::Base
  validates :title, :description, :problem_set_id, presence: true
  belongs_to :problem_set, class_name: 'ProblemSet', foreign_key: :problem_set_id
  has_many :answers, class_name: 'Answer', foreign_key: :question_id
  has_many :hints, class_name: 'Hint', foreign_key: :question_id
end
