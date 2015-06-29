# == Schema Information
#
# Table name: hints
#
#  id          :integer          not null, primary key
#  description :text
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Hint < ActiveRecord::Base
  validates :description, :question_id, presence: true
  belongs_to :question, class_name: 'Question', foreign_key: :question_id
end
