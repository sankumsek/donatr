require 'spec_helper'

describe "donation process" do
  it "adds a donation to a cause" do
    visit '/login'
    user = User.create(name: 'user', password: 'password', password_confirmation: 'password')
    fill_in 'Name', :with => 'user'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    page.should have_content 'Welcome, user!'
    cause = Cause.create(name: 'new cause', description: 'new cause')
    visit '/'
    click_on 'new cause'
    click_on 'Donate!'
    fill_in 'Amount', :with => 10
    click_button 'Donate'
    page.should have_content 'Thanks for your donation!'
  end

  it "gives a user an error if the amount isn't provided" do
    visit '/login'
    user = User.create(name: 'user', password: 'password', password_confirmation: 'password')
    fill_in 'Name', :with => 'user'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    page.should have_content 'Welcome, user!'
    cause = Cause.create(name: 'new cause', description: 'new cause')
    visit '/'
    click_on 'new cause'
    click_on 'Donate!'
    click_button 'Donate'
    page.should have_content 'Please fix these errors:'
  end
end
