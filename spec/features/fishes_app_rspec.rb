require "spec_helper"

feature "Anonymous user" do
  scenario "user can register"

  visit "/"
  click_on "Register"
  visit "/register"

  fill_in "Username", with => "kelly"
  fill_in "Password", with => "password"

  expect(page).to have_content "Thank you for registering!"

end