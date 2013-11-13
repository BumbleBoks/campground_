require "spec_helper"

describe "Missing Trail pages" do
  let (:user) { FactoryGirl.create(:user) }
  let (:admin) { FactoryGirl.create(:admin) }
  
  subject { page }
    
  describe "edit an existing missing trail" do
    let(:missing_trail) { FactoryGirl.create(:missing_trail) }
    let (:submit) { "Save updates" }
    let (:back) { "Back" }
    
    describe "without logging in" do
      before { visit edit_common_missing_trail_path(missing_trail) }
      it_should_behave_like "home page when not logged in"
    end
    
    describe "as a regular user" do
      before do
        log_in user
        visit edit_common_missing_trail_path(missing_trail)
      end
      it { should have_page_title("Campground - #{user.name}'s Campsite") }
      it { should have_selector('h2', text: "My campsite") } 
    end
    
    describe "as an admin" do
      before do
        log_in admin
        visit edit_common_missing_trail_path(missing_trail)
      end
      it { should have_page_title('Campground - Missing Trail') }
      it { should have_selector('h2', text: missing_trail.id) }
      it { should have_content(missing_trail.info) }

      describe "after making changes and saving the trail" do
        before do
          fill_in "Updates", with: "Great trail"
          click_button submit
        end

        it { should have_page_title('Campground - Missing Trail') }
        it { should have_selector('h2', text: missing_trail.id) }
        it { should have_content(missing_trail.info) }
        it { should have_content("Great trail") }
      end
      
      describe "after making changes and clicking back" do
        before do
          fill_in "Updates", with: "Long trail"
          click_button back
        end

        it { should have_page_title('Campground - Missing Trail') }
        it { should have_selector('h2', text: missing_trail.id) }
        it { should have_content(missing_trail.info) }
        it { should_not have_content("Long trail") }
      end
      
    end # admin   
  end # edit trail page
  

end