require 'rails_helper'

RSpec.describe TagsController, type: :controller do

  let(:tag) {
    question = FactoryGirl.create(:question)
    FactoryGirl.create(:tag, questions: [question])
  }

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {name: tag.name.delete("#") }
      expect(response).to be_success
    end
  end
end
