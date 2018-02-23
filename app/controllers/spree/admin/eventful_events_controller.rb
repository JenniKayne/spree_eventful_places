module Spree
  module Admin
    class EventfulEventsController < ResourceController
      protected

      def location_after_save
        edit_admin_eventful_event_path
      end
    end
  end
end
