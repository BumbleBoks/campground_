# == Schema Information
#
# Table name: community_trades
#
#  id             :integer          not null, primary key
#  trader_id      :integer          not null
#  trade_type     :string(255)      not null
#  gear           :string(255)      not null
#  description    :text             not null
#  activity_id    :integer
#  trade_location :string(255)      not null
#  min_price      :decimal(6, 2)
#  max_price      :decimal(6, 2)
#  completed      :boolean          default(FALSE)
#  created_at     :datetime
#  updated_at     :datetime
#

class Community::Trade < ActiveRecord::Base
  belongs_to :trader, 
             class_name: "User"
             
  validates :trade_type, presence: true
  validates :gear, presence: true
  validates :description, presence: true,
                          length: { maximum: 500 }
  validates :trade_location,  presence: true
  validates :trader_id, presence: true
end
