require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      FactoryGirl.create(:user, username: "ra1"),
      FactoryGirl.create(:user, username: "ra2"),
      FactoryGirl.create(:user, username: "ra3")
    ])
  end

  it "renders a list of users" do
    render

    expect(rendered).to match "ra1"
    expect(rendered).to match "ra2"
    expect(rendered).to match "ra3"
  end
end
