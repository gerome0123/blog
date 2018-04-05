# Sunspot::Setup.class_eval do
#   #
#   # Return the Field with the given (public-facing) name
#   #
#   def field!(field_name)
#     @field_factories_cache[field_name.to_sym]
#   end
# end
#
# Sunspot::CompositeSetup.class_eval do
#   #
#   # Return the Field with the given (public-facing) name
#   #
#   def field!(field_name)
#     fields_hash[field_name.to_sym]
#   end
# end
#
# Sunspot::Rails.configuration.instance_variable_get('@user_configuration')['auto_index_callback'] = 'after_commit'
#
# require 'sunspot/queue/session_proxy'
#
# Sunspot::Queue::SessionProxy.class_eval do
#   def commit_if_dirty(_ = false); end
#
#   def commit_if_delete_dirty(_ = false); end
#
#   def commit(_ = false); end
# end
#
# require 'sunspot/queue/sidekiq'
# backend = Sunspot::Queue::ActiveJob::Backend.new
# Sunspot.session = Sunspot::Queue::SessionProxy.new(Sunspot.session, backend)
