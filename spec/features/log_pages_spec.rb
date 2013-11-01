require "spec_helper"

describe "Log pages" do
  after(:all) { clear_all_databases }
  let (:user) { FactoryGirl.create(:user) }  
  subject { page }
  
  describe "show an existing log" do
    let (:log) { FactoryGirl.create(:log, user: user) }

    describe "without logging in" do
      before do
        log_date = log.log_date
        visit corner_logs_path(log_date.year, log_date.month, log_date.day)
      end 
      it_should_behave_like "home page when not logged in"
    end
    
    describe "as the user with log" do
      before do
        log_in user
        log_date = log.log_date
        visit corner_logs_path(log_date.year, log_date.month, log_date.day)
      end
      it { should have_page_title("Campground - #{user.name}'s Diary") }
      it { should have_selector('h2', text: "My Logs") } 
      it { should have_content(log.log_date.to_formatted_s(:calendar_date)) }
      it { should have_content(log.title) }
      it { should have_content(log.content) }
      it { should have_link ("Edit") }
      it { should have_link ("Delete") }
    end
    
    # test - date is set in correct order in js
    describe "as a user for particular log date" do
      before do
        log_in user
        log_date = Date.new(2013, 1, 31)
        visit corner_logs_path(log_date.year, log_date.month, log_date.day)
      end
      it { should have_content("Change Log") }
    end
    
  end
  
  describe "creating a new log" do
    let (:submit) { "Save log" }
    
    describe "without logging in" do
      before { visit new_corner_log_path }
      it_should_behave_like "home page when not logged in"
    end
    
    describe "as a regular user" do
      before do
        log_in user
        visit new_corner_log_path
      end
      it { should have_page_title("Campground - #{user.name}'s Diary") }
      it { should have_selector('h2', text: "New Log") } 
    
    
      describe "with insufficient information" do
        it "should not create a new log" do
          expect { click_button submit }.not_to change(Corner::Log, :count)
        end
      end

      describe "after submitting empty form" do
        before { click_button submit }

        it { should have_page_title("Campground - #{user.name}'s Diary") }
        it { should have_content('error') }
        it { should have_content('Title can\'t be blank') }
        it { should have_content('Content can\'t be blank') }
      end
    
      describe "with sufficient valid information" do
        before do
          fill_in "Title", with: "New Log"
          fill_in "Content", with: "A great hike!"
        end

        it "should create a log" do
          expect { click_button submit }.to change(Corner::Log, :count).by(1)
        end   
      
        describe "should create a new log and show the new log" do
          before { click_button submit }

          it { should have_page_title("Campground - #{user.name}'s Diary") }
          it { should have_content(Date.current().to_formatted_s(:calendar_date)) }
          it { should have_content("New Log") }
          it { should have_content("A great hike!") }
        end 
      end # valid submission              
    end # authorized user
  end # new log page

  describe "updating a log" do
    let (:submit) { "Save log" }
    
    before do
      @user_log = FactoryGirl.create(:log, user: user)
    end
    
    describe "without logging in" do
      before { 
        visit edit_corner_log_path(@user_log.log_date.year, @user_log.log_date.month, 
        @user_log.log_date.day) 
      }
      it_should_behave_like "home page when not logged in"
    end
    
    describe "as a regular user" do
      before do
        log_in user
        visit edit_corner_log_path(@user_log.log_date.year, @user_log.log_date.month, 
          @user_log.log_date.day)
      end
      it { should have_page_title("Campground - #{user.name}'s Diary") }
      it { should have_selector('h2', text: "Change Log") } 
      it { should have_content(@user_log.title) }
      it { should have_content(@user_log.content) }    
    
      describe "with empty form" do
        before do
          fill_in "Title", with: ""
          fill_in "Content", with: ""
          click_button submit
        end
        it { should have_page_title("Campground - #{user.name}'s Diary") }
        it { should have_content('error') }
        it { should have_content('Title can\'t be blank') }
        it { should have_content('Content can\'t be blank') }
      end
    
      describe "with sufficient valid information" do
        before do
          fill_in "Title", with: "New Log"
          fill_in "Content", with: "A great hike!"
        end

        it "should update the log" do
          expect { click_button submit }.not_to change(Corner::Log, :count)
        end   
      
        describe "should update the log and show it" do
          before { click_button submit }

          it { should have_page_title("Campground - #{user.name}'s Diary") }
          it { should have_content("New Log") }
          it { should have_content("A great hike!") }
        end 
      end # valid submission              
    end # authorized user
  end # edit log page
  
  describe "delete log" do
    let (:log) { FactoryGirl.create(:log, user: user) }

    before do
      log_in user
      log_date = log.log_date
      visit corner_logs_path(log_date.year, log_date.month, log_date.day)
    end 
    
    it "should delete the log" do
      expect { click_link('Delete') }.to change(Corner::Log, :count).by(-1)
    end
    
    describe "should show empty log form" do
      before do
        @log_id = log.id
        click_link('Delete') 
      end 
      
      it { should_not have_content(Date.current().to_formatted_s(:calendar_date)) }
      it { should_not have_link("Edit") }
      it { should_not have_link("Delete") }
      it { should have_content("Date") }
      it { should have_content("Title") }
      it { should have_content("Content") }
      
      it "should not find the log" do
        Corner::Log.find_by(id: @log_id).should be_nil
      end
    end
  end # delete log 
  
end
    
