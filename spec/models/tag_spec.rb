require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe '#name_downcase' do
    let(:tag) { FactoryGirl.create(:tag, name: '#ТегТестовый567') }

    context 'when tag is correct name' do
      it 'correct' do
        expect(tag.name).to eq('#тегтестовый567')
      end
      it 'incorrect' do
        expect(tag.name).not_to eq('#ТегТестовый567')
      end
    end

    context 'when not create duplicate tag' do
      it 'not create' do
        tag
        tag2 = FactoryGirl.build(:tag, name: '#ТегТесТовЫЙ567')
        expect(tag2.validate).to be_falsey
        expect(tag2.save).to be_falsey
      end
    end
  end

  describe '.parse_hash_tags' do
    let(:text) { 'Текст #tag #TAg #taG #tag777.09' }
    context 'when correct parsing tags' do
      it 'correct' do
        expect(Tag.parse_hash_tags(text)).to(
          contain_exactly('#tag', '#TAg', '#taG', '#tag777')
        )
      end
    end
  end
end
