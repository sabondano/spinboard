require 'rails_helper'

feature 'user logs in and out' do
  scenario 'with valid credentials' do
    User.create(email: 'user@example.com',
                password: 'foobar',
                password_confirmation: 'foobar')

    visit root_path
    click_link 'Log in'

    expect(current_path).to eq('/login')

    fill_in 'session_email', with: 'user@example.com'
    fill_in 'session_password', with: 'foobar'
    click_button 'Log in'

    expect(current_path).to eq('/links')
  end

  scenario 'with invalid credentials' do
    visit root_path
    click_link 'Log in'

    expect(current_path).to eq('/login')

    fill_in 'session_email', with: 'user@example.com'
    fill_in 'session_password', with: 'foobar'
    click_button 'Log in'

    expect(current_path).to eq('/login')
  end

  scenario 'user signs out' do
    User.create(email: 'user@example.com',
                password: 'foobar',
                password_confirmation: 'foobar')

    visit root_path
    click_link 'Log in'

    expect(current_path).to eq('/login')

    fill_in 'session_email', with: 'user@example.com'
    fill_in 'session_password', with: 'foobar'
    click_button 'Log in'

    expect(current_path).to eq('/links')

    click_link 'Log out'

    expect(current_path).to eq('/login')
  end
end
