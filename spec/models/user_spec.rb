require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:first_name).when('Anthony', 'Jane') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Watson', 'Jones') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:email).when('anthony.jones@gmail.com',
    'jane.watson@yahoo.com') }
  it { should_not have_valid(:email).when(nil, 'jane', '.com', 'jane@net',
    'anthony.com') }

  it { should have_valid(:phone_number).when('6175555555') }
  it { should_not have_valid(:phone_number).when('222', '', 'abc123def456',
    nil) }

  it 'requires a unique email' do
    user = FactoryGirl.create(:user)
    other_user = FactoryGirl.create(:user)
    other_user.email = user.email
    expect(other_user).to_not be_valid
    expect(other_user.errors).to_not be_blank
  end
end
