require 'rails_helper'

feature 'user changes link status', js: true do
  before do
    user = User.create(email: 'user@example.com',
                       password: 'foobar',
                       password_confirmation: 'foobar')

    @link = user.links.create(title: 'wowie',
                              url: 'http://www.wowie.com')

    visit root_path
    click_link 'Log in'
    fill_in 'session_email', with: 'user@example.com'
    fill_in 'session_password', with: 'foobar'
    click_button 'Log in'
  end

  scenario 'sees it without the page reloading' do
    click_button 'Mark as Read'

    within('#links') do
      expect(page).to have_content('true')
    end
  end
end
