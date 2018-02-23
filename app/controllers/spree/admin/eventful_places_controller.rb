module Spree
  module Admin
    class EventfulPlacesController < ResourceController
      protected

      def location_after_save
        edit_admin_eventful_place_path @eventful_place
      end
    end
  end
end
