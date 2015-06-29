# == Schema Information
#
# Table name: problem_sets
#
#  id          :integer          not null, primary key
#  deploy_date :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProblemSet < ActiveRecord::Base
  validates :deploy_date, presence: true
  has_many :problems, class_name: 'Question', foreign_key: :problem_set_id

  has_many :answers, through: :problems, source: :answers
  has_many :hints, through: :problems, source: :hints
end
