require 'spec_helper'

describe UsersController, :type => :api do

  render_views

  before :all do
    User.create(email: 'harry@ga.co', password: '123', password_confirmation: '123')
  end

  describe 'GET index' do
    it "returns list of users" do
      get :index, :format => :json
      expect(response.status).to eq 200
      expect(response.body).to include 'harry@ga.co'
      expect(JSON.load(response.body)["users"][0]["email"]).to eq 'harry@ga.co'
    end
  end

  describe 'GET show' do
    it "returns one user" do
      get :show, :id => 1, :format => :json
      expect(response.status).to eq 200
      expect(response.body).to_not be_nil
      expect(JSON.load(response.body)["email"]).to eq "harry@ga.co"
    end
  end

end