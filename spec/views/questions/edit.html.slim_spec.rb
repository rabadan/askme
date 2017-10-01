require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, FactoryGirl.create(:question))
    User.authenticate(@question.user.email, '123456')
  end

  it "renders the edit question form" do
    render
    assert_select "form[action=?][method=?]", question_path(@question), "post" do
    end
  end
end
