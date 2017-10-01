require 'rails_helper'

RSpec.feature "UserCreateQuestions", type: :feature do
  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }

  before(:each) do
    user
  end

  scenario 'success create question' do
    login(user)

    visit user_path(user2)

    fill_in 'question[text]', with: "Вопрос: #tag как дела?"
    click_button 'Задать вопрос'
    expect(page).to have_content("Вопрос: #tag как дела?")
  end

  scenario 'success find question on tag' do
    FactoryGirl.create(:question, text: "question1 #tag #Tag #tAg #taG", answer: "#answer1")
    FactoryGirl.create(:question, text: "question2 #tag #Tag #tAg #taG", answer: "#answer2")
    FactoryGirl.create(:question, text: "question3 #teg #Teg #teg #teG", answer: "#answer3")

    visit '/'

    click_link '#tag'
    expect(page).to have_content("question1 #tag #Tag #tAg #taG")
    expect(page).to have_content("question2")
    expect(page).not_to have_content("question3")


    click_link '#answer3'

    expect(page).to have_content("question3 #teg #Teg #teg #teG")
    expect(page).not_to have_content("question1")
    expect(page).not_to have_content("question2")
  end


  def login(user_loging)
    visit '/session/new'

    fill_in 'Email', with: user_loging.email
    fill_in 'Пароль', with: user_loging.password
    click_button 'Войти'
  end
end
