require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    describe "create a new user" do
      it "positive result, user is created" do
        params = { user: {
          username: 'username',
          email: 'email@test.com',
          password: 'password'
        } }

        get :create, params: params
        users = User.all
        expect(users.length).to eq(1)
        expect(subject.request.flash[:success]).to eq('Successfully signed up')
        expect(response).to redirect_to( root_path )
      end

      it "negative result, password not long enough" do
        params = { user: {
          username: 'username',
          email: 'email@test.com',
          password: 'pass'
        } }

        get :create, params: params
        users = User.all
        expect(users.length).to eq(0)
        expect(subject.request.flash[:warning]).to eq('Form is invalid')
      end
    end
  end
end