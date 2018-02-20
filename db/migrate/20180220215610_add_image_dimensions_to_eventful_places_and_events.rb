class AddImageDimensionsToEventfulPlacesAndEvents < ActiveRecord::Migration[5.1]
  def change
    change_table :spree_eventful_events do |t|
      t.integer :image_width
      t.integer :image_height
    end

    change_table :spree_eventful_places do |t|
      t.integer :image_width
      t.integer :image_height
    end
  end
end
