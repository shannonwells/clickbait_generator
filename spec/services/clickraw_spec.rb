require 'rails_helper'

describe Clickraw do
  include FlickrawWebmocks

  let(:photo_id) {"1234567"}
  let(:owner_id) {"123466@N99"}

  let(:search_results) {
    {"photos": {"page": 1, "pages": 3, "perpage": 100, "total": "225",
                "photo": [
                    {"id": photo_id, "owner": owner_id, "secret": "affc933a94", "server": "3867", "farm": 4, "title": "Image from page 347 of \"Animal Life and the World of Nature; A magazine of Natural History\" (1902)", "ispublic": 1, "isfriend": 0, "isfamily": 0},
                    {"id": "15845971444", "owner": "40544385@N04", "secret": "ee524a462e", "server": "8646", "farm": 9, "title": "Scully", "ispublic": 1, "isfriend": 0, "isfamily": 0},
                    {"id": "14582868358", "owner": owner_id, "secret": "14f3fe707e", "server": "3903", "farm": 4, "title": "Image from page 281 of \"Motion Picture Studio Directory and Trade Annual (1917)\" (1917)", "ispublic": 1, "isfriend": 0, "isfamily": 0}
                ]}, "stat": "ok"}
  }
  let(:user_info) {
    {"id" => owner_id, "nsid" => owner_id, "ispro" => 0, "can_buy_pro" => 1, "iconserver" => "3852", "iconfarm" => 4, "path_alias" => "internetarchivebookimages", "has_stats" => "1", "username" => "Internet Archive Book Images", "description" => "The Internet Archive, a 501(c)(3) non-profit, is building a digital library of Internet sites and other cultural artifacts in digital form. Like a paper library, we provide free access to researchers, historians, scholars, the print disabled, and the general public.\n\n<a href=\"https://archive.org/\" rel=\"nofollow\">archive.org/</a>", "photosurl" => "https://www.flickr.com/photos/internetarchivebookimages/", "profileurl" => "https://www.flickr.com/people/internetarchivebookimages/", "mobileurl" => "https://m.flickr.com/photostream.gne?id=126355692", "photos" => {"firstdatetaken" => "1825-01-01 00:00:00", "firstdate" => "1406334253", "count" => 5328416}}
  }
  let(:photo_info) {
    {"id" => photo_id, "secret" => "47c3e9024e", "server" => "2912", "farm" => 3, "dateuploaded" => "1406710392", "isfavorite" => 0, "license" => "7", "safety_level" => "0", "rotation" => 0, "originalsecret" => "3098f5ee1b", "originalformat" => "jpg", "owner" => {"nsid" => owner_id, "username" => "Internet Archive Book Images", "realname" => "", "location" => "", "iconserver" => "3852", "iconfarm" => 4, "path_alias" => "internetarchivebookimages"}, "title" => "Image from page 345 of \"American cookery\" (1914)", "description" => "some_stuff", "visibility" => {"ispublic" => 1, "isfriend" => 0, "isfamily" => 0}, "dates" => {"posted" => "1406710392", "taken" => "1914-01-01 00:00:00", "takengranularity" => "8", "takenunknown" => "0", "lastupdate" => "1480466691"}, "views" => "5989", "editability" => {"cancomment" => 0, "canaddmeta" => 0}, "publiceditability" => {"cancomment" => 1, "canaddmeta" => 1}, "usage" => {"candownload" => 1, "canblog" => 0, "canprint" => 0, "canshare" => 1}, "comments" => "0", "notes" => [], "people" => {"haspeople" => 0}, "tags" => [{"id" => "126355692-14597878628-223596499", "author" => owner_id, "authorname" => "Internet Archive Book Images", "raw" => "bookid:americancookery19unse_0", "_content" => "bookidamericancookery19unse0", "machine_tag" => 0}, {"id" => "126355692-14597878628-225771442", "author" => owner_id, "authorname" => "Internet Archive Book Images", "raw" => "bookyear:1914", "_content" => "bookyear1914", "machine_tag" => 0}, {"id" => "126355692-14597878628-219498633", "author" => owner_id, "authorname" => "Internet Archive Book Images", "raw" => "bookdecade:1910", "_content" => "bookdecade1910", "machine_tag" => 0}, {"id" => "126355692-14597878628-216433447", "author" => owner_id, "authorname" => "Internet Archive Book Images", "raw" => "bookcentury:1900", "_content" => "bookcentury1900", "machine_tag" => 0}, {"id" => "126355692-14597878628-223456549", "author" => owner_id, "authorname" => "Internet Archive Book Images", "raw" => "bookpublisher:New_York__etc_____Whitney_Publications__etc__", "_content" => "bookpublishernewyorketcwhitneypublicationsetc", "machine_tag" => 0}, {"id" => "126355692-14597878628-239237311", "author" => owner_id, "authorname" => "Internet Archive Book Images", "raw" => "bookcontributor:Boston_Public_Library", "_content" => "bookcontributorbostonpubliclibrary", "machine_tag" => 0}, {"id" => "126355692-14597878628-239237321", "author" => owner_id, "authorname" => "Internet Archive Book Images", "raw" => "booksponsor:Boston_Public_Library", "_content" => "booksponsorbostonpubliclibrary", "machine_tag" => 0}, {"id" => "126355692-14597878628-240492942", "author" => owner_id, "authorname" => "Internet Archive Book Images", "raw" => "bookleafnumber:345", "_content" => "bookleafnumber345", "machine_tag" => 0}, {"id" => "126355692-14597878628-237866938", "author" => owner_id, "authorname" => "Internet Archive Book Images", "raw" => "bookcollection:cookbooks", "_content" => "bookcollectioncookbooks", "machine_tag" => 0}, {"id" => "126355692-14597878628-240385811", "author" => owner_id, "authorname" => "Internet Archive Book Images", "raw" => "bookcollection:bostonpubliclibrary", "_content" => "bookcollectionbostonpubliclibrary", "machine_tag" => 0}, {"id" => "126355692-14597878628-237786508", "author" => owner_id, "authorname" => "Internet Archive Book Images", "raw" => "bookcollection:americana", "_content" => "bookcollectionamericana", "machine_tag" => 0}], "urls" => [{"type" => "photopage", "_content" => "https://www.flickr.com/photos/internetarchivebookimages/14597878628/"}], "media" => "photo"}
  }

  let(:empty_results) { { "photos": { "page": 1, "pages": 0, "perpage": 100, "total": 0, "photo": [] }, "stat": "ok" }}

  subject(:clickraw) {described_class.new}

  before do
    mock_flickraw_setup
  end

  describe "flickr_url" do
    before do
      stub_get_photo_info
    end

    subject {clickraw.flickr_url(photo_id)}
    it "returns a url for the photo_id given" do
      expect(subject).to eql "https://farm3.staticflickr.com/2912/#{photo_id}_47c3e9024e_z.jpg"
    end
  end

  describe "flickr_user" do
    before do
      stub_get_people_info
    end
    subject {clickraw.flickr_user(owner_id)}

    it "returns a hash with profile url" do
      expect(subject[:owner_url]).to eql "https://www.flickr.com/people/internetarchivebookimages/"
    end
    it "returns a hash with owner info" do
      expect(subject[:owner]).to eql "Internet Archive Book Images (Flickr: @internetarchivebookimages)"
    end
  end

  describe "run" do
    subject {clickraw.run(["kitten", "water"])}

    context "when a match is found" do
      before do
        stub_request(:post, "https://api.flickr.com/services/rest/").
            with(:body => {"format" => "json", "license" => "5,7,9,10", "method" => "flickr.photos.search",
                           "nojsoncallback" => "1", "privacy_filter" => "1", "safe_search" => "true", "per_page" => "1",
                           "sort" => "relevance", "text" => "kitten water"}).
            to_return(:status => 200, :body => JSON.generate(search_results), :headers => {})

        stub_request(:post, "https://api.flickr.com/services/rest/").
            with(:body => {"format" => "json", "method" => "flickr.people.getInfo", "nojsoncallback" => "1", "user_id" => owner_id}).
            to_return(:status => 200, :body => JSON.generate(user_info), :headers => {})

        stub_request(:post, "https://api.flickr.com/services/rest/").
            with(:body => {"format" => "json", "method" => "flickr.photos.getInfo", "nojsoncallback" => "1", "photo_id" => photo_id}).
            to_return(:status => 200, :body => JSON.generate(photo_info), :headers => {})
      end

      it "returns the URL of the first response" do
        expect(subject[:url]).to eql "https://farm3.staticflickr.com/2912/#{photo_id}_47c3e9024e_z.jpg"
      end

      it "returns the owner of the first response" do
        expect(subject[:owner]).to eql "Internet Archive Book Images (Flickr: @internetarchivebookimages)"
      end

    end

    context "when there is a nil response" do

      before do
        stub_search empty_results
        stub_fallback_search search_results
        stub_get_people_info
        stub_get_photo_info
        allow(SecureRandom).to receive(:random_number).and_return(0)
      end

      it "gets a random sample from the latest 30 most interesting photos" do
        subject
      end

      it "completes without error" do
        expect{subject}.not_to raise_exception
      end

      it "still returns a photo" do
        expect(subject[:url]).to eql "https://farm3.staticflickr.com/2912/#{photo_id}_47c3e9024e_z.jpg"
      end

    end
  end

  def stub_get_people_info
    stub_request(:post, "https://api.flickr.com/services/rest/").
        with(:body => {"format" => "json", "method" => "flickr.people.getInfo", "nojsoncallback" => "1", "user_id" => owner_id}).
        to_return(:status => 200, :body => JSON.generate(user_info), :headers => {})
  end

  def stub_get_photo_info
    stub_request(:post, "https://api.flickr.com/services/rest/").
        with(:body => {"format" => "json", "method" => "flickr.photos.getInfo", "nojsoncallback" => "1", "photo_id" => photo_id}).
        to_return(:status => 200, :body => JSON.generate(photo_info), :headers => {})
  end

  def stub_search(result)
    stub_request(:post, "https://api.flickr.com/services/rest/").
        with(:body => {"format" => "json", "license" => "5,7,9,10", "method" => "flickr.photos.search",
                       "nojsoncallback" => "1", "privacy_filter" => "1", "safe_search" => "true", "per_page" => "1",
                       "sort" => "relevance", "text" => "kitten water"}).
        to_return(:status => 200, :body => JSON.generate(result))
  end

  def stub_fallback_search(result)
    stub_request(:post, "https://api.flickr.com/services/rest/").
        with(body: {"format"=>"json", "license"=>"5,7,9,10", "method"=>"flickr.photos.search", "nojsoncallback"=>"1",
                    "per_page"=>"30", "privacy_filter"=>"1", "safe_search"=>"true", "sort"=>"interestingness-desc"}).
        to_return(status: 200, body: JSON.generate(result), headers: {})

  end
end