module Spree
  class EventfulPlacesController < Spree::StoreController
    def index
      @eventful_places = Spree::EventfulPlace.all
    end
  end
end
