# == Schema Information
#
# Table name: corner_favorite_trails
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  trail_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Corner::FavoriteTrail < ActiveRecord::Base

  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :trail, class_name: "Common::Trail", :foreign_key => "trail_id"
  
  validates :trail_id, presence: true
  validates :user_id, presence: true

end
