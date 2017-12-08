module Spree
  # Planned event related to one of the Eventful Places
  class EventfulEvent < Spree::Base
    belongs_to :place, class_name: 'EventfulPlace'
    validates :name, :place, presence: true

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

    def pretty_starts_at
      pretty_datetime(starts_at)
    end

    def pretty_ends_at
      pretty_datetime(ends_at)
    end

    private

    def pretty_datetime(datetime)
      datetime.strftime("%Y-%m-%d %l:%M %p")
    end
  end
end
