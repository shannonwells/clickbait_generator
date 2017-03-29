require 'rails_helper'

describe Clickraw do
  # let(:flickraw) { object_double("FlickRaw::Flickr").as_stubbed_const  }
  let(:photo_id) { "14597878628" }
  let(:owner_id) { "126377022@N07" }

  let(:search_results) {
    [{"id"=>"14597878628", "owner"=>"126377022@N07", "secret"=>"47c3e9024e", "server"=>"2912", "farm"=>3, "title"=>"Image from page 345 of \"American cookery\" (1914)", "ispublic"=>1, "isfriend"=>0, "isfamily"=>0}, {"id"=>"2382275608", "owner"=>"10559879@N00", "secret"=>"a5af74f8d8", "server"=>"3274", "farm"=>4, "title"=>"6,134 photos in Flickr Explore 2008.04.02", "ispublic"=>1, "isfriend"=>0, "isfamily"=>0}, {"id"=>"4151400560", "owner"=>"38567649@N00", "secret"=>"144ecf51fe", "server"=>"2524", "farm"=>3, "title"=>"", "ispublic"=>1, "isfriend"=>0, "isfamily"=>0}]
  }
  let(:user_info) {
    {"id"=>"126377022@N07", "nsid"=>"126377022@N07", "ispro"=>0, "can_buy_pro"=>1, "iconserver"=>"3852", "iconfarm"=>4, "path_alias"=>"internetarchivebookimages", "has_stats"=>"1", "username"=>"Internet Archive Book Images", "description"=>"The Internet Archive, a 501(c)(3) non-profit, is building a digital library of Internet sites and other cultural artifacts in digital form. Like a paper library, we provide free access to researchers, historians, scholars, the print disabled, and the general public.\n\n<a href=\"https://archive.org/\" rel=\"nofollow\">archive.org/</a>", "photosurl"=>"https://www.flickr.com/photos/internetarchivebookimages/", "profileurl"=>"https://www.flickr.com/people/internetarchivebookimages/", "mobileurl"=>"https://m.flickr.com/photostream.gne?id=126355692", "photos"=>{"firstdatetaken"=>"1825-01-01 00:00:00", "firstdate"=>"1406334253", "count"=>5328416}}
  }
  let(:photo_info) {
    {"id"=>"14597878628", "secret"=>"47c3e9024e", "server"=>"2912", "farm"=>3, "dateuploaded"=>"1406710392", "isfavorite"=>0, "license"=>"7", "safety_level"=>"0", "rotation"=>0, "originalsecret"=>"3098f5ee1b", "originalformat"=>"jpg", "owner"=>{"nsid"=>"126377022@N07", "username"=>"Internet Archive Book Images", "realname"=>"", "location"=>"", "iconserver"=>"3852", "iconfarm"=>4, "path_alias"=>"internetarchivebookimages"}, "title"=>"Image from page 345 of \"American cookery\" (1914)", "description"=>"some_stuff", "visibility"=>{"ispublic"=>1, "isfriend"=>0, "isfamily"=>0}, "dates"=>{"posted"=>"1406710392", "taken"=>"1914-01-01 00:00:00", "takengranularity"=>"8", "takenunknown"=>"0", "lastupdate"=>"1480466691"}, "views"=>"5989", "editability"=>{"cancomment"=>0, "canaddmeta"=>0}, "publiceditability"=>{"cancomment"=>1, "canaddmeta"=>1}, "usage"=>{"candownload"=>1, "canblog"=>0, "canprint"=>0, "canshare"=>1}, "comments"=>"0", "notes"=>[], "people"=>{"haspeople"=>0}, "tags"=>[{"id"=>"126355692-14597878628-223596499", "author"=>"126377022@N07", "authorname"=>"Internet Archive Book Images", "raw"=>"bookid:americancookery19unse_0", "_content"=>"bookidamericancookery19unse0", "machine_tag"=>0}, {"id"=>"126355692-14597878628-225771442", "author"=>"126377022@N07", "authorname"=>"Internet Archive Book Images", "raw"=>"bookyear:1914", "_content"=>"bookyear1914", "machine_tag"=>0}, {"id"=>"126355692-14597878628-219498633", "author"=>"126377022@N07", "authorname"=>"Internet Archive Book Images", "raw"=>"bookdecade:1910", "_content"=>"bookdecade1910", "machine_tag"=>0}, {"id"=>"126355692-14597878628-216433447", "author"=>"126377022@N07", "authorname"=>"Internet Archive Book Images", "raw"=>"bookcentury:1900", "_content"=>"bookcentury1900", "machine_tag"=>0}, {"id"=>"126355692-14597878628-223456549", "author"=>"126377022@N07", "authorname"=>"Internet Archive Book Images", "raw"=>"bookpublisher:New_York__etc_____Whitney_Publications__etc__", "_content"=>"bookpublishernewyorketcwhitneypublicationsetc", "machine_tag"=>0}, {"id"=>"126355692-14597878628-239237311", "author"=>"126377022@N07", "authorname"=>"Internet Archive Book Images", "raw"=>"bookcontributor:Boston_Public_Library", "_content"=>"bookcontributorbostonpubliclibrary", "machine_tag"=>0}, {"id"=>"126355692-14597878628-239237321", "author"=>"126377022@N07", "authorname"=>"Internet Archive Book Images", "raw"=>"booksponsor:Boston_Public_Library", "_content"=>"booksponsorbostonpubliclibrary", "machine_tag"=>0}, {"id"=>"126355692-14597878628-240492942", "author"=>"126377022@N07", "authorname"=>"Internet Archive Book Images", "raw"=>"bookleafnumber:345", "_content"=>"bookleafnumber345", "machine_tag"=>0}, {"id"=>"126355692-14597878628-237866938", "author"=>"126377022@N07", "authorname"=>"Internet Archive Book Images", "raw"=>"bookcollection:cookbooks", "_content"=>"bookcollectioncookbooks", "machine_tag"=>0}, {"id"=>"126355692-14597878628-240385811", "author"=>"126377022@N07", "authorname"=>"Internet Archive Book Images", "raw"=>"bookcollection:bostonpubliclibrary", "_content"=>"bookcollectionbostonpubliclibrary", "machine_tag"=>0}, {"id"=>"126355692-14597878628-237786508", "author"=>"126377022@N07", "authorname"=>"Internet Archive Book Images", "raw"=>"bookcollection:americana", "_content"=>"bookcollectionamericana", "machine_tag"=>0}], "urls"=>[{"type"=>"photopage", "_content"=>"https://www.flickr.com/photos/internetarchivebookimages/14597878628/"}], "media"=>"photo"}
  }

  subject(:clickraw) { described_class.new }

  before do
    flickraw =  double "something", {
        "photos" => { "search" => search_results, "getInfo" => photo_info},
        "people" => { "getInfo" => user_info }
    }
    allow(FlickRaw::Flickr).to receive(:new).and_return(object_double("FlickRaw::Flickr").as_stubbed_const )
  end

  describe "flickr_url" do
    subject { clickraw.flickr_url(photo_id) }
    it "returns a url for the photo_id given" do
      expect(subject).to eql "https://farm3.staticflickr.com/2912/14597878628_47c3e9024e_b.jpg"
    end
  end
  describe "flickr_user" do
    subject { clickraw.flickr_user(owner_id) }
    it "returns a hash with profile url" do
      expect(subject["owner_url"]).to eql "https://www.flickr.com/people/internetarchivebookimages/"
    end
    it "returns a hash with owner info" do
      expect(subject["owner"]).to eql "Internet Archive Book Images (internetarchivebookimages)"
    end
  end
  describe "flickr_search"
end