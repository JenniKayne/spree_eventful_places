Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'add_eventful_places_to_admin_sidebar_menu',
  insert_bottom: '#main-sidebar',
  partial: 'spree/admin/shared/eventful_places_sidebar_menu'
)
