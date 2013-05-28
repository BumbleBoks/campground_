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
