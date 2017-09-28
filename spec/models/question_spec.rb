require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'validations check' do
    it { should validate_presence_of :name }

    subject { FactoryGirl.build(:tag) }

    it { should validate_uniqueness_of :name }
  end
end
