require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:q) { FactoryGirl.create(:question, text: '#вопрос #КакойТоТег666 Это #воПрОс?', answer: 'Это #отВет на #ВОПРОс')}

  context '.update_tags' do
    it 'correct crate tags' do
      expect(q.tags.map(&:name)).to contain_exactly('#вопрос', '#какойтотег666', '#ответ')
    end
  end
end
