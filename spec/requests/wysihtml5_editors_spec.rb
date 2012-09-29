# encoding: UTF-8
require 'spec_helper'

describe "Wysihtml5Editors" do
  before(:each) do
    @admin = FactoryGirl.create(:admin)

    visit '/'
    click_link "Войти"
    fill_in "Ваш email",  :with => @admin.email
    fill_in "Пароль", :with => 'qwerty'
    click_button "Войти"
  end

  describe "Panel" do
    before(:each) do
      click_link "Статьи"
      click_link "Создать новую статью"
    end

    it "should have toolbar", :js => true do
      page.should have_css('ul.wysihtml5-toolbar')
    end
  end
end
