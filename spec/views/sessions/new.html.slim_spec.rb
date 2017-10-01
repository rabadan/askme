require 'rails_helper'

RSpec.describe "sessions/new", type: :view do
  it "renders new session form" do
    render

    assert_select "form[action=?][method=?]", session_path, "post" do
    end
  end
end
