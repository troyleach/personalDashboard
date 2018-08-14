require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe "current_user" do
    it "expect positive result" do
      user = User.new(username: 'username',
                      email: 'test1@email.com',
                      password: 'password')
      user.save
      session[:user_id] = user.id
      expect(subject.current_user).to eq(user)
    end
  end

end
