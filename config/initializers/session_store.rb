# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fitnesstrackr_session',
  :secret      => 'ddd791653bfab2e3b0e4a1b949e2844ed84a5512b2b17c93bc09eb5171222f0a61477ed29052156f253cf2f0a7ed3d9305c680bf9dca22e3ae41a767c910dfef'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
