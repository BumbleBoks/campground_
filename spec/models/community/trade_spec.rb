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

require 'spec_helper'

describe Community::Trade do
  after(:all) { clear_all_databases } 
  
  let (:user) { FactoryGirl.create(:user) }
  let (:activity) { FactoryGirl.create(:activity) }
  before { @trade = user.trades.build(gear: 'Headlamp', description: 'Brand new!', activity_id: activity.id,
      trade_type: 'sell', trade_location: 'Timbaktu') }
  subject { @trade }
  
  it { should be_valid }
  it { should respond_to(:trade_type) }
  it { should respond_to(:gear) }
  it { should respond_to(:description) }
  it { should respond_to(:activity_id) }
  it { should respond_to(:trader_id) }
  it { should respond_to(:trader) }
  it { should respond_to(:min_price) }
  it { should respond_to(:max_price) }
  it { should respond_to(:trade_location) }
  it { should respond_to(:completed) }
  
  it { should_not be_completed }
  
  it { should be_invalid_with_attribute_value(:trade_type, nil) }
  it { should be_invalid_with_attribute_value(:gear, nil) }
  it { should be_invalid_with_attribute_value(:description, nil) }
  it { should be_invalid_with_attribute_value(:trader_id, nil) }
  it { should be_invalid_with_attribute_value(:trade_location, nil) }

end
