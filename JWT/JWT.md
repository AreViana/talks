# JWT

>  [PRESENTATION](JWT_presentation.pdf) 🎉

## Definition
- Is an open standard ([RFC 7519](https://datatracker.ietf.org/doc/html/rfc7519)).
- Is compact and URL-safe.
- Is a safe way to transmit information(claims) between 2 parties as a JSON object.
- Is intended for environments with space limitations, such as HTTP authorization headers and URI query parameters.
- Can be signed using a secret (with the HMAC algorithm) or a public/private key pair using RSA or ECDSA.
- Are always represented using the JWS Compact Serialization or the JWE Compact Serialization.

## Base concepts

### Encoding
- The purpose is to transform data so that it can be safely consumed by a different type of system.
- Can be reversed by employing the same algorithm that encoded the content.
- No secret key is needed.
- E.g: ASCII, unicode, base64URL, base64

### Encryption
- Requires a secret key.
- The purpose is to transform the data to keep it secret from other systems.
- The two main kinds of encryption are symmetric encryption(one key) and asymmetric encryption(2 keys public and private).

### HMACSHA256
- HMAC:
  - MAC: Message Authentication Code.
  - H: Uses a cryptographic hash function (SHA256, MD5) with a secret key.
  - The resulting algorithm is concatenated HMAC-MD5 or HMAC-SHA256.
  - Security depends on the cryptographic strength of the underlying hash function and the quality of the key.
- SHA-256:
  - SHA: Secure Hash Algorithm is a cryptographic hash function.
  - 256: Generates a nearly unique, fixed-size 256-bit (32-byte) hash.
- It is considered a one-way function, but with current computational power it is possible to decode this algorithm.

## Serialization
There are 2 popular cryptographic mechanisms to represents encrypted content using JSON data structures
- JWS (it has 3 parts)
- JWE (it has 5 parts)

### JWS Compact Serialization

Structure:
```
BASE64URL(JWS Header) + '.' + BASE64URL(JWS Payload) + '.' + BASE64URL(JWS Signature)
```

Execute:
```bash
  ruby jwt_generator.rb
```

Example:

```ruby
  require 'base64'
  require 'json'
  require 'time'
  require 'securerandom'
  require 'openssl'

  ########## HEADER ##########
  header = { alg: "HS256", typ: "JWT" }.to_json
  header_encode = Base64.urlsafe_encode64(header)
  header == Base64.urlsafe_decode64(header_encode)

  ########## PAYLOAD ##########
  # Expires in 10 minutes from now
  exp = Time.new + (60 * 10)
  sub = SecureRandom.uuid
  payload = { sub: sub, exp: exp.to_i }.to_json
  payload_encode = Base64.urlsafe_encode64(payload)
  payload == Base64.urlsafe_decode64(payload_encode)

  ########## SIGNATURE ##########
  key = SecureRandom.uuid
  algorithm = 'SHA256'
  data = header_encode + '.' + payload_encode

  hmac_sha256 = OpenSSL::HMAC.hexdigest(algorithm, key, data)
  signature = Base64.urlsafe_encode64(hmac_sha256)

  ########## JWT ##########
  token = data + '.' + signature

```

## Web Security
1. The server must check if the token was signed by itself.

2. Set short-lived tokens, with a short expiration time, the time frame for an attacker to do some damage is reduced.

3. Don't store tokens that contain readable information, we can only extract its jti claim, which is a unique identifier.

4. Don't add private information unless you encrypt your tokens.

5. Don't add changing information that could change user behavior, such as the user's role if you want to use it to query permissions.

6. Be careful what you use to identify a user. Using incremental IDs is not recommended; instead, use a UUID to identify your resources.


## Revocation Strategies

- Change the Secret: Invalidate absolutely all issued tokens.
- Attached token: A entity has one token.
- Denylist: Invalidate specific tokens.
- Allowlist: Validate specific tokens.

## REFERENCES

- [JWT Interactive](https://jwt.io/introduction/)
- [RFC 7519 - JWT](https://datatracker.ietf.org/doc/html/rfc7519)
- [RFC7515 - JWS](https://datatracker.ietf.org/doc/html/rfc7515)
- [RFC7516 - JWE](https://datatracker.ietf.org/doc/html/rfc7516)
- [RFC7518 - JWA](https://datatracker.ietf.org/doc/html/rfc7518)
- [JWT Revocation process](https://waiting-for-dev.github.io/blog/2017/01/23/stand_up_for_jwt_revocation)
- [Encryption vs. Encoding](https://danielmiessler.com/study/encoding-encryption-hashing-obfuscation/#:~:text=Encoding%20is%20for%20maintaining%20data,order%20to%20return%20to%20plaintext)
