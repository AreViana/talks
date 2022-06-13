require 'base64'
require 'json'
require 'time'
require 'securerandom'
require 'openssl'

########## HEADER ##########
header = { alg: "HS256", typ: "JWT" }.to_json
header_encode = Base64.urlsafe_encode64(header)
header == Base64.urlsafe_decode64(header_encode)
puts "\n"
puts 'Header: ' + header
puts 'Header base64URL encoded: ' + header_encode

########## PAYLOAD ##########
# Expires in 10 minutes from now
exp = Time.new + (60 * 10)
sub = SecureRandom.uuid
payload = { sub: sub, exp: exp.to_i }.to_json
payload_encode = Base64.urlsafe_encode64(payload)
payload == Base64.urlsafe_decode64(payload_encode)
puts "\n"
puts 'Payload: ' + payload
puts 'Payload base64URL encoded: ' + payload_encode

########## SIGNATURE ##########
key = SecureRandom.uuid
algorithm = 'SHA256'
data = header_encode + '.' + payload_encode

hmac_sha256 = OpenSSL::HMAC.hexdigest(algorithm, key, data)
signature = Base64.urlsafe_encode64(hmac_sha256)
puts "\n"
puts 'Signature base64URL encoded: ' + signature

########## JWT ##########
token = data + '.' + signature
puts "\n"
puts '-----------------JWT------------------'
puts token
