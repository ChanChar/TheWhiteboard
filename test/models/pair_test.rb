# == Schema Information
#
# Table name: pairs
#
#  id         :integer          not null, primary key
#  user1      :integer          not null
#  user2      :integer          not null
#  user3      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PairTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
