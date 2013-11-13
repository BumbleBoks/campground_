# == Schema Information
#
# Table name: community_updates
#
#  id         :integer          not null, primary key
#  content    :text
#  author_id  :integer
#  trail_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Community::Update < ActiveRecord::Base
  belongs_to :author, 
             class_name: "User"
  
  belongs_to :trail, 
             class_name: "Common::Trail"
  
  validates :content, presence: true,
            length: { maximum: 500 }
  validates :author_id, presence: true
  validates :trail_id, presence: true
  
  default_scope { order('created_at DESC') }
end
