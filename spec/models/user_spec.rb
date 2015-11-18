require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(email: "user@example.com",
             password: "foobar",
             password_confirmation: "foobar")
  end

  it "is valid" do
    expect(user).to be_valid
  end
end
