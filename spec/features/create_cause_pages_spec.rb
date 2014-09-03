require 'spec_helper'

describe "the create a cause process" do
  it "creates a new cause" do
    visit '/login'
    user = User.create(name: 'user', password: 'password', password_confirmation: 'password')
    fill_in 'Name', :with => 'user'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    page.should have_content 'Welcome, user!'
    visit '/causes/new'
    fill_in 'Name', :with => 'new cause'
    fill_in 'Description', :with => 'new cause'
    click_button 'Create Cause'
    page.should have_content 'Cause added!'
  end

  it "gives a user an error if the description isn't provided" do
    visit '/login'
    user = User.create(name: 'user', password: 'password', password_confirmation: 'password')
    fill_in 'Name', :with => 'user'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    page.should have_content 'Welcome, user!'
    visit '/causes/new'
    fill_in 'Name', :with => 'new cause'
    fill_in 'Description', :with => ''
    click_button 'Create Cause'
    page.should have_content 'Please fix these errors'
  end
end
