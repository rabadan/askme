require 'rails_helper'
require 'tag'

RSpec.describe Tag, type: :model do
  context 'validations check' do
    it { should validate_presence_of :name }

    subject { FactoryGirl.build(:tag) }

    it { should validate_uniqueness_of :name }
  end

  context '#parse_hash_tags' do
    let(:text) { "Текст #tag #TAg #taG #tag777.09" }

    it { expect(Tag.parse_hash_tags(text)).to contain_exactly("#tag", "#TAg","#taG" ,"#tag777") }
  end
end
