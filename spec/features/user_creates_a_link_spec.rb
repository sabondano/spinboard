require 'rails_helper'

feature 'user creates a link' do
  before do
    User.create(email: 'user@example.com',
                password: 'foobar',
                password_confirmation: 'foobar')
    visit root_path
    click_link 'Log in'
    fill_in 'session_email', with: 'user@example.com'
    fill_in 'session_password', with: 'foobar'
    click_button 'Log in'
  end

  scenario 'with valid data' do
    fill_in 'link_title', with: "wowie"
    fill_in 'link_url', with: "http://www.wowie.com"
    click_button 'Create Link'

    expect(current_path).to eq('/links')
    expect(page).to have_content('wowie')
    expect(page).to have_content('http://www.wowie.com')
  end

  scenario 'with invalid data' do
    fill_in 'link_title', with: "wowie"
    fill_in 'link_url', with: "wowie"
    click_button 'Create Link'

    expect(current_path).to eq('/links')
    expect(page).to_not have_content('wowie')
    expect(page).to have_content('Please provide a title and a valid url.')
  end
end
