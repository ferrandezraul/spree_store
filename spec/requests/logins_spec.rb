# To make Capybara 'page' work (and to make Capybara interactions like click_button or fill_in work),
# instead of retrieving with rspec's 'get', you need to retrieve with Capybara's 'visit':
#
# DEBUG: Use save_and_open_page
# Capybara matchers: http://rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Matchers


require 'spec_helper'

describe "Login", :js => true do

  describe "Visit login page", :js => true do
    it "can go to log in page", :driver => :webkit  do
      visit spree.login_path
      save_and_open_page
      page.should have_selector("input[type='submit'][value=#{Spree.t(:login)}]")
      #page.should have_selector("input[type='submit'][value='Login']")
    end
  end

  #describe "GET /tasks" do
  #  it "displays products" do
  #    Task.create!(:name => "paint fence")
  #    visit tasks_path
  #    page.should have_content("paint fence")
  #  end

  #  it "supports js", :js => true do
  #    visit tasks_path
  #    click_link "test js"
  #    page.should have_content("js works")
  #  end

  #describe "POST /tasks" do
  #  it "creates task" do
  #    visit tasks_path
  #    fill_in "New Task", :with => "mow lawn"
  #    click_button "Add"
  #    # save_and_open_page
  #    page.should have_content("Successfully added task.")
  #    page.should have_content("mow lawn")
  #  end
  #end

end

