require 'rails_helper'
require 'rake'

describe 'Clickbait Generator', :feature, :js do
  include HomeHelper
  include Headlines

  before do
    create_a_few_models
  end

  shared_examples_for "a Clickbait Generator page" do
    it 'has all the layout elements' do
      expect(page).to have_text("This is Clickbait Generator.")
      expect(page).to have_text("Get the Source")
      click_on 'Home'
      click_on 'What?'
      expect(page).to have_text 'About This Thing'
      click_on 'Home'
    end
    it "lets me share the headline to Twitter" do
      headline = find("#headline").text
      within_frame(find('.twitter-share-button')) do
        click_on 'Tweet'
      end
    end
    it "lets me share the headline's permalink" do
      link_share_window = window_opened_by do
        click_on 'Share Permalink'
      end
      within_window(link_share_window) do
        expect(page).to have_text(headline)
      end
      # expect()
    end
  end

  context 'when I first go to the page' do
    before do
      visit '/'
    end
    it_behaves_like "a Clickbait Generator page"

    it "has all the button types" do
      Clickbait::HEADLINE_TYPES.each do |headline_type|
        expect(page).to have_text list_type_title(headline_type)
      end
    end

  end

  context 'when I click on a button' do
    Clickbait::HEADLINE_TYPES.each do |headline_type|
      before do
        visit '/'
        find("##{headline_type}").click
      end

      it_behaves_like "a Clickbait Generator page"

    end
  end

end
