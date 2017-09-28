require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations check' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :username }

    subject { FactoryGirl.build(:user) }

    it { should validate_uniqueness_of :email }
  end
end
