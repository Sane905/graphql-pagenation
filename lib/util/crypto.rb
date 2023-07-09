module Util
  module Crypto
    def compute_checksum(*strings)
      Digest::SHA256.base64digest(strings * ':').tr('+/', '-_').delete('=')
    end

    def compute_encryption_key(*strings)
    # OpenSSL::Cipher rejects invalid length keys in Ruby 2.4 or later.
    # https://github.com/attr-encrypted/encryptor/issues/26
    # https://github.com/ruby/ruby/commit/ce635262f53b760284d56bb1027baebaaec175d1
      compute_checksum(*strings)[0..31]
    end

    def rsa_public_encrypt(public_key, str)
    begin
      public_key_obj = OpenSSL::PKey::RSA.new(public_key)
    rescue OpenSSL::PKey::RSAError
      return nil
    end

    Base64.encode64(public_key_obj.public_encrypt(str))
    end

    def generate_auth_token
      SecureRandom.hex(32)
    end
  end
end
