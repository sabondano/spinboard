require 'rails_helper'

feature 'user edits a link' do
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

  scenario 'with valid data' do
    click_link 'edit'
    fill_in 'link_title', with: "wowie plus"
    fill_in 'link_url', with: "http://www.wowie.com/plus"
    click_button 'Update Link'

    expect(current_path).to eq('/links')
    expect(page).to have_content('wowie plus')
    expect(page).to have_content('http://www.wowie.com/plus')
  end

  scenario 'with invalid data' do
    click_link 'edit'
    fill_in 'link_title', with: "wowie"
    fill_in 'link_url', with: ""
    click_button 'Update Link'

    expect(current_path).to eq("/links/#{@link.id}/edit")
    expect(page).to have_content('Please provide a title and a valid url.')
  end
end
