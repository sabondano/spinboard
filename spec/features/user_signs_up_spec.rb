require 'rails_helper'

feature 'user signs up' do
  scenario 'with valid credentials' do
    visit root_path
    click_link 'Sign up'

    expect(current_path).to eq('/signup')

    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'foobar'
    fill_in 'user_password_confirmation', with: 'foobar'
    click_button 'Create my account'

    expect(current_path).to eq('/links')
    expect(User.count).to eq(1)
  end
end
