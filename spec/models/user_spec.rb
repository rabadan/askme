require 'rails_helper'

RSpec.describe User, type: :model do
  context 'valid username' do
    it { should allow_value('user_name').for(:username) }
    it { should allow_value('user_name123').for(:username) }
    it { should allow_value('user123').for(:username) }
    it { should_not allow_value('user-123').for(:username) }
    it { should_not allow_value('user#123').for(:username) }
    it { should_not allow_value('user?').for(:username) }
    it { should_not allow_value('').for(:username) }
  end

  context 'color valid' do
    it { should allow_value('#000').for(:color) }
    it { should allow_value('#3f3f3f').for(:color) }
    it { should_not allow_value('#0001').for(:color) }
    it { should_not allow_value('3f3f3f').for(:color) }
  end
end
