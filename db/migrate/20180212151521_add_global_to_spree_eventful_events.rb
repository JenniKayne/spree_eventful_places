class AddGlobalToSpreeEventfulEvents < ActiveRecord::Migration[5.1]
  def change
    change_table :spree_eventful_events do |t|
      t.boolean :global
    end
  end
end
