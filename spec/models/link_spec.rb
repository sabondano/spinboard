require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link) do
    Link.new(title: "Cool Link",
             url: "http://www.awesome.com/cool-link")
  end

  let(:invalid_link) do
    Link.new(title: "Not Valid Link",
             url: "notvalidurl##")
  end

  it "is valid" do
    expect(link).to be_valid
  end

  it "is invalid" do
    expect(invalid_link).to_not be_valid
  end

  it "has a read status that defaults to false" do
    expect(link.read).to eq(false)
  end
end
