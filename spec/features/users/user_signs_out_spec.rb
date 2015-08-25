require "rails_helper"

feature "user signs out", %q(

  As a registered user
  I want to sign out
  So that I'm no longer logged in

  Acceptance Criteria
  [ ] I must be able to sign out from a link on navbar.
  [ ] Upon signing out, I see a notification of successful sign out.

) do

  scenario "successful sign out" do
    user = FactoryGirl.create(:user)

    visit root_path
    #need to refactor into helper method
    click_on "Login"

    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "Login"

    click_link "Logout"

    expect(page).to have_content "Signed out successfully."
    expect(page).to have_content "Login"
  end

end
