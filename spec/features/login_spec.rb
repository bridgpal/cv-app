require 'spec_helper'

feature 'signing in' do
  scenario 'redirects to the login page when not signed in' do
    visit '/'
    expect(current_path).to eq '/login'
  end

  scenario 'log in' do
    visit '/login'

    # fill in email
    fill_in 'Email', with: 'joe@example.com'
    # fill in password
    fill_in 'Password', with: '123'
    # click Sign in button
    click_button 'Sign in'
    # 
    expect(current_path).to eq '/'
  end
end