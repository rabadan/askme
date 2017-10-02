require 'rails_helper'

RSpec.describe 'tags/show', type: :view do
  before(:each) do
    question = FactoryGirl.create(:question, text: 'текст #teg')
    @tags = Tag.all
    @tag = assign(:tag, FactoryGirl.create(:tag, name: '#tegtegteg', questions: [question]))
    @questions = [question]
  end

  it 'renders tags' do
    render
    expect(rendered).to match '#teg'
    expect(rendered).to match '#tegtegteg'
    expect(rendered).to match "текст #{link_to('#teg',tag_path('teg'))}"
  end
end
