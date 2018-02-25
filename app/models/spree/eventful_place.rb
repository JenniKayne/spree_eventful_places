module Spree
  # Place where events are planned at
  class EventfulPlace < Spree::Base
    has_many :events, class_name: 'EventfulEvent', foreign_key: :place_id
    scope :active, -> { where(active: true) }
    scope :ordered, -> { order(:position) }
    validates :name, presence: true

    has_attached_file :image,
                      styles: {
                        mini: '200x>',
                        standard: '900x>',
                        retina: '1350x>',
                      },
                      default_style: :standard,
                      url: '/spree/evenful_places/:id/:style/:basename.:extension',
                      path: ':rails_root/public/spree/evenful_places/:id/:style/:basename.:extension'

    validates_attachment :image,
                         content_type: {
                           content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
                         }
    after_post_process :find_dimensions

    def all_events
      @all_events ||= events.or(Spree::EventfulEvent.global)
    end

    def find_dimensions
      temporary = image.queued_for_write[:original]
      filename = temporary.path unless temporary.nil?
      filename = image.path if filename.blank?
      geometry = Paperclip::Geometry.from_file(filename)
      self.image_width = geometry.width
      self.image_height = geometry.height
    end

    def geolocation_url
      address_param = CGI.escape(ActionController::Base.helpers.strip_tags(address))
      "https://www.google.com/maps/search/?api=1&query=#{address_param}+#{geolocation_url_suffix}"
    end

    def geolocation_url_suffix; end
  end
end
