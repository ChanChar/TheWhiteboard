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

require 'test_helper'

class HintTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
