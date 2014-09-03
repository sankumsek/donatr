require 'spec_helper'

describe "the sign up process" do
  it "signs up a user with a name and password" do
    visit '/signup'
    fill_in 'Name', :with => 'user'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign Up'
    page.should have_content 'Thanks for signing up!'
  end

  it "gives a user an error if the passwords don't match" do
    visit '/signup'
    fill_in 'Name', :with => 'user'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'bad'
    click_button 'Sign Up'
    page.should have_content 'Please fix these errors'
  end
end
