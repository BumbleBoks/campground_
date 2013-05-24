require "spec_helper"

describe Corner::LogsHelper do
  describe "generate log show path with nil input" do
    before do
      @actual_output = generate_log_path(nil)
      @expected_output = '/corner/logs/new'
    end
    it { @actual_output.should eq(@expected_output) }
  end

  describe "generate log show path with non-nil input" do
    before do
      user = FactoryGirl.create(:user)
      log = user.logs.create(title: "Test log", content: "Nice long run", 
        log_date: Date.new(2013, 04, 22) )
      @actual_output = generate_log_path(log)
      @expected_output = '/corner/logs/2013/4/22'
    end
    it { @actual_output.should eq(@expected_output) }
  end
  
end