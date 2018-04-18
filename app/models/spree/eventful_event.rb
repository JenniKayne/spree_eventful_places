module Spree
  # Planned event related to one of the Eventful Places
  class EventfulEvent < Spree::Base
    belongs_to :place, class_name: 'EventfulPlace'
    validates :name, presence: true
    scope :global, -> { where(global: true) }

    has_attached_file :image,
                      styles: {
                        mini: '200x>',
                        standard: '900x>',
                        retina: '1350x>',
                      },
                      default_style: :standard,
                      url: '/spree/evenful_events/:id/:style/:basename.:extension',
                      path: ':rails_root/public/spree/evenful_events/:id/:style/:basename.:extension'

    validates_attachment :image,
                         content_type: {
                           content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
                         }
    after_post_process :find_dimensions

    def find_dimensions
      temporary = image.queued_for_write[:original]
      filename = temporary.path unless temporary.nil?
      filename = image.path if filename.blank?
      geometry = Paperclip::Geometry.from_file(filename)
      self.image_width = geometry.width
      self.image_height = geometry.height
    end

    def place_name
      place.nil? ? '' : place.name
    end

    def pretty_starts_at
      pretty_datetime(starts_at)
    end

    def pretty_ends_at
      pretty_datetime(ends_at)
    end

    private

    def pretty_datetime(datetime)
      return '' if datetime.blank?
      datetime.strftime("%Y-%m-%d %I:%M %p")
    end
  end
end
