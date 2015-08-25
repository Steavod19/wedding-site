require "rails_helper"

feature "user signs in", %q(

  As a user
  I want to sign in
  So that I can be signed in

  Acceptance Criteria:
  [ ] I must be able to sign in with my email address and password.
  [ ] I must see a notification indicating success upon signing in.
  [ ] If there are errors, I see notifications.

) do

  scenario "user successfully signs in" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link "Login"

    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "Login"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Logout"
    expect(page).to_not have_content "Login"
    expect(page).to_not have_content "Sign Up"
  end

end
