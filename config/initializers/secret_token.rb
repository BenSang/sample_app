# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end
SampleApp::Application.config.secret_token = 'fe3201d87d79d61d90594034cadb662c1177b35f9441807a982f256b88748284593605c7b77c16b9dcbc94ae99acb2b096ea973d6f7e1637ead241425f0b66a7'
SampleApp::Application.config.secret_key_base = secure_token
