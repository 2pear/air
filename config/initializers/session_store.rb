# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_air_session',
  :secret      => '00587e29ccfb5718bf2bbbb659241ad142f27d618172cc6eae3531651c67355951a2142c288f494e02e0452f58fb8d85f5a85c2b315579b40c0cbcbe1b607a7b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
