require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:q) { FactoryGirl.create(:question) }

  context 'test' do
    it { expect(q.text).to eq 'Как твои дела? #КакойТоТег666 Это точно вопрос?' }
  end
end
