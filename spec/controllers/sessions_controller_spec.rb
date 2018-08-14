require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "positive result" do
      user = User.new(username: 'username', email: 'test1@email.com', password: 'password')
      user.save
      params = { session: {
                   email: 'test1@email.com',
                   password: 'password'
                 } }

      post :create, params: params

      expect(session[:user_id]).to eq(user.id)
      expect(subject.request.flash[:success]).to eq('Welcome back!')
      expect(response).to redirect_to( home_path )
    end

    it "negative result" do
      user = User.new(username: 'username', email: 'test1@email.com', password: 'password')
      user.save
      params = { session: {
                   email: 'test1@email.com',
                   password: 'wrongPassword'
                 } }

      post :create, params: params

      expect(session[:user_id]).to be(nil)
      expect(subject.request.flash[:error]).to eq('Invalid email/password combination')
      expect(response).to redirect_to( login_path )
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      user = User.new(username: 'username', email: 'test1@email.com', password: 'password')
      user.save
      params = { session: {
                   email: 'test1@email.com',
                   password: 'password'
                 } }

      get :create, params: params

      expect(session[:user_id]).to eq(user.id)

      get :destroy

      expect(session[:user_id]).to be(nil)
      expect(subject.request.flash[:success]).to eq('You have logged out')
      expect(response).to redirect_to( login_path )
    end
  end

end
