module Capybara
  class Session
    def get_page_location_hash
      self.evaluate_script( %q{ document.location.hash } )
    end
    def has_location_hash?(hash)
      get_page_location_hash == "##{hash}"
    end
    def has_no_location_hash?
      get_page_location_hash.empty?
    end
  end
end
