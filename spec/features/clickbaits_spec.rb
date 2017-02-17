require 'rails_helper'
require 'rake'

describe 'Clickbait Generator', :feature, :js do
  include HomeHelper
  include Headlines

  before do
    create_a_few_models
  end

  shared_examples_for "a Clickbait Generator page" do

    it "lets me share the headline to Twitter" do
      headline = page.find("#headline").text
      within_frame(page.find('.twitter-share-button')) do
        click_on 'Tweet'
      end
    end

    it "lets me share the headline's permalink" do
      begin
        headline = page.find("#headline").text
        click_on 'Share Permalink'
        locator = page.find(".modal")
        expect(locator).to have_text(headline)
      end
    end

  end

  context "when I visit the home page" do
    before do
      visit '/'
    end

    it_behaves_like "a Clickbait Generator page"

    it 'has all the layout elements' do
      expect(page).to have_text("This is Clickbait Generator.")
      expect(page).to have_text("Get the Source")
      click_on 'Home'
      click_on 'What?'
      expect(page).to have_text 'About This Thing'
      click_on 'Home'
    end

    it "has all the button types" do
      Clickbait::HEADLINE_TYPES.each do |headline_type|
        expect(page).to have_text list_type_title(headline_type)
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


  context  "when I visit a permalink" do
    let(:clickbait) { Clickbait.create headline: "something hilarious", headline_type: 'listicle' }

    before do
      visit "/##{clickbait.id}"
    end
    it "shows the existing headline" do
      expect(page.find("#headline").text()).to eql clickbait.headline
    end
    it "includes the clickbait id in the url hash" do
      expect(page).to have_location_hash clickbait.id
    end
    it "clears the hash after fetching a new clickbait" do
      find("#listicle").click
      expect(page).to have_no_location_hash
    end

    it_behaves_like "a Clickbait Generator page"
  end

end
