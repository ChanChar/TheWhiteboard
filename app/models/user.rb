# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  provider   :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  validates :name, :provider, :uid, presence: true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.github_url = auth['info']['urls']['GitHub']
      user.image_url = auth['info']['image']
    end
  end

  def make_pairs
    user_ids = (1..User.all.length).to_a
    pairs = []
    until user_ids.empty?
      pair = []
      if user_ids.length.odd?
        pair << User.find(user_ids.delete_at(rand(user_ids.length) + 1))
      end
      2.times do
        pair << User.find(user_ids.delete_at(rand(user_ids.length) + 1))
      end
      pairs << pair
    end

    pairs.each do |students|
      Pair.create(*students)
    end
  end

  def partner
    today_pairs = Pair.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
end
