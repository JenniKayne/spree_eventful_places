module Spree
  module Admin
    class EventfulPlacesController < ResourceController
      protected

      def location_after_save
        edit_admin_eventful_place_path
      end
    end
  end
end
