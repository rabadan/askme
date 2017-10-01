require 'rails_helper'

RSpec.describe Tag, type: :model do
  context 'unique tags' do
    it '.name_downcase' do
      tag = FactoryGirl.create(:tag, name: "#ТегТестовый567")
      expect(tag.name).to eq("#тегтестовый567")
    end

    it 'not create duplicate tag' do
      tag1 = FactoryGirl.build(:tag, name: "#ТегТесТовЫЙ567")
      expect(tag1.validate).to be_truthy
      expect(tag1.save).to be_truthy
      tag2 = FactoryGirl.build(:tag, name: "#ТегТесТовЫЙ567")
      expect(tag2.validate).to be_falsey
      expect(tag2.save).to be_falsey
    end
  end

  context '#parse_hash_tags' do
    let(:text) { "Текст #tag #TAg #taG #tag777.09" }

    it { expect(Tag.parse_hash_tags(text)).to contain_exactly("#tag", "#TAg","#taG" ,"#tag777") }
  end

  context '#remove_unlinked_tags!' do
    # todo
  end
end
