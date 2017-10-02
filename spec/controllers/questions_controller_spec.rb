require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }
  let(:user_path_redirect) { user_path(User.find(valid_attributes[:user_id])) }
  let(:question) { FactoryGirl.create(:question, user: user) }

  let(:valid_attributes) { {text: 'Текст', user_id: user.id} }
  let(:invalid_attributes) {{ text: '', user: nil } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # QuestionsController. Be sure to keep this updated too.
  let(:valid_session) { {user_id: user.id} }

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: {id: question.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Question' do
        expect {
          post :create, params: {question: valid_attributes}, session: valid_session
        }.to change(Question, :count).by(1)
        expect(Question.last.author).to eq(user)
      end

      it 'redirects to the created question' do
        post :create, params: {question: valid_attributes}, session: valid_session
        expect(response).to redirect_to(user_path_redirect)
      end
    end

    context 'with valid params on Guest' do
      it 'creates a new Question' do
        expect {
          post :create, params: {question: valid_attributes}
        }.to change(Question, :count).by(1)
        expect(Question.last.author_id).to be_nil
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {question: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params on Auth users' do
      let(:new_attributes) { { text: 'new text' } }

      it 'updates the requested question' do
        put :update, params: {id: question.to_param, question: new_attributes}, session: valid_session
        question.reload
        expect(question.text).to eq new_attributes[:text]
      end

      it 'redirects to the question' do
        put :update, params: {id: question.to_param, question: valid_attributes}, session: valid_session
        expect(response).to redirect_to(user_path_redirect)
      end
    end

    context 'with valid params on Guest' do
      let(:new_attributes) { { text: 'new text', user_id: user.id } }

      it 'updates the requested question' do
        put :update, params: {id: question.to_param, question: new_attributes}
        question.reload
        expect(question.text).not_to eq new_attributes[:text]
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: question.to_param, question: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested question' do
      q = question
      expect {
        delete :destroy, params: {id: q.to_param}, session: valid_session
      }.to change(Question, :count).by(-1)
    end

    it 'redirects to the questions list' do
      delete :destroy, params: {id: question.to_param}, session: valid_session
      expect(response).to redirect_to(user_path_redirect)
    end
  end
end
