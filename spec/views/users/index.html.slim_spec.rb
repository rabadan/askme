require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
      FactoryGirl.create(:user, username: 'user1'),
      FactoryGirl.create(:user, username: 'user2'),
      FactoryGirl.create(:user, username: 'user3')
    ])
  end

  it 'renders a list of users' do
    render

    expect(rendered).to match 'user1'
    expect(rendered).to match 'user2'
    expect(rendered).to match 'user3'
  end
end
