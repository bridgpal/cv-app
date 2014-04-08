require 'spec_helper'

feature 'Signing in' do
  scenario 'redirects to the sign in page when not signed in' do
    visit '/'
    expect(current_path).to eq('/login')
  end
end
