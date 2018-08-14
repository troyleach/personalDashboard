require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      user = User.new(username: 'username', email: 'test1@email.com', password: 'password')
      user.save
      session[:user_id] = user.id

      get :index
      expect(response).to have_http_status(:success)
    end

    it 'negative result for user not being logged in' do
      get :index
      expect(subject.request.flash[:error]).to eq('You must be logged in to access that page!')
    end
  end

end
