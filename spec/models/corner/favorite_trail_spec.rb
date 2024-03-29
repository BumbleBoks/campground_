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

require 'spec_helper'

describe Corner::FavoriteTrail do
  let(:user) { FactoryGirl.create(:user) }
  let(:trail) { create_trail }
  before { @favorite_trail = user.favorite_trails.create(trail_id: trail.id) }
  subject { @favorite_trail }
  
  it { should be_valid }
  it { should respond_to(:user_id) }
  it { should respond_to(:trail_id) }
  it { should respond_to(:user) }
  it { should respond_to(:trail) }
  
  it { should be_invalid_with_attribute_value(:user_id, nil) }
  it { should be_invalid_with_attribute_value(:trail_id, nil) }
  
  describe "accessible attributes", broken: true do
    it "should not allow access to user_id" do
      expect do
        Corner::FavoriteTrail.new(user_id: user.id, trail_id: trail.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
