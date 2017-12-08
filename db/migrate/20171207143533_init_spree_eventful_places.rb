class InitSpreeEventfulPlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_eventful_places, force: :cascade do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :opening_hours
      t.string :cta
      t.string :url
      t.boolean :active
      t.boolean :geolocate
      t.text :description
      t.integer :position
      t.attachment :image
    end

    create_table :spree_eventful_events, force: :cascade do |t|
      t.integer :place_id
      t.string :name
      t.text :description
      t.text :details
      t.text :address
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :cta
      t.string :url
      t.attachment :image
    end
  end
end
