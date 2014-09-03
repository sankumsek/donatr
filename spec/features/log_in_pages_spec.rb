require 'spec_helper'

describe "the log in process" do
  it "logs a user in who uses the right password" do
    visit '/login'
    user = User.create(name: 'user', password: 'password', password_confirmation: 'password')
    fill_in 'Name', :with => 'user'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    page.should have_content 'Welcome, user!'
  end

  it "gives a user an error who uses the wrong password" do
    visit '/login'
    user = User.create(name: 'user', password: 'password', password_confirmation: 'password')
    fill_in 'Name', :with => 'user'
    fill_in 'Password', :with => 'wrong'
    click_button 'Log In'
    page.should have_content 'Name or password is invalid'
  end
end
