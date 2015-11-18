require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    xit "redirects to sign up or log in if user is unauthenticated" do
      expect(response).to render_template :signup_or_login
    end
  end

end
