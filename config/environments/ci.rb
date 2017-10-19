Rails.application.configure do
  config.cache_classes = true
  config.eager_load = false
  config.serve_static_files = true
  config.static_cache_control = 'public, max-age=3600'

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false

  config.action_mailer.delivery_method = :test

  config.active_support.deprecation = :stderr

  # Raises error for missing translations
  config.action_view.raise_on_missing_translations = true
end
