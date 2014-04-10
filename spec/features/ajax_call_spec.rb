require 'spec_helper'

feature 'ajax call' do

  background :all do
    User.create(email: 'harry@ga.co', password: '123', password_confirmation: '123')
  end
  
  scenario 'ajax call', :js => true do
    visit '/login'

    fill_in 'Email', with: 'joe@example.com'
    fill_in 'Password', with: '123'
    click_button 'Sign in'

    click_link 'Ajax Call'
    # wait until the jquery / ajax call finishes
    wait_for_ajax
    # Look for style in any element
    expect(page).to have_css('.user', text: 'Ajax')
    # Look for the content using selector
    expect(find('#users')).to have_content('harry@ga.co')
  end

  scenario 'backbone call', :js => true do
    visit '/login'

    fill_in 'Email', with: 'joe@example.com'
    fill_in 'Password', with: '123'
    click_button 'Sign in'

    visit '/#/users'

    expect(page).to have_content('harry@ga.co')
  end

end