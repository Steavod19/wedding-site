require "rails_helper"

feature "a user signs up", %q(

  As an unregistered user
  I want to sign up for this hip, hip site
  So that I can partake in the festivities and happenings and such

  Acceptance Criteria:
  [x] I must specify a valid email address, password, and password confirmation
  [ ] If I don't specify the required information, I am presented with an error message

) do

  scenario 'specify valid credentials' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'first name', with: 'Tony'
    fill_in 'last name', with: 'Perkis'
    fill_in 'email', with: 'tony@perkis_system.com'
    fill_in 'phone number', with: '2813308004'
    fill_in 'Password', with: 'hustle123'
    fill_in 'password confirmation', with: 'hustle123'

    click_button 'Register'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(page).to have_content 'Logout'
  end
end
