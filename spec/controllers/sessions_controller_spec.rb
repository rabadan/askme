require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { FactoryGirl.create(:user, email: 'test@test.ru') }

  # create user
  before(:each) do
    user
  end
  # This should return the minimal set of attributes required to create a valid
  # Session. As you add validations to Session, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { email: 'test@test.ru', password: 123456 }
  }

  let(:invalid_attributes) {
    { email: 'test@test.ru', password: 1234567890 }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SessionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "POST #create" do

    context "with valid params" do
      it "creates a new Session" do
        post :create, params: valid_attributes
        expect(session[:user_id]).to eq(user.id)
      end

      it "redirects to the created session" do
        post :create, params: valid_attributes
        expect(response).to redirect_to(root_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: invalid_attributes
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested session" do
      session[:user_id] = user.id
      delete :destroy, params: {}, session: { user_id: user.id }
      expect(session[:user_id]).not_to be
    end

    it "redirects to the sessions list" do
      delete :destroy, params: {}, session: { user_id: user.id }
      expect(response).to redirect_to(root_path)
    end
  end

end
