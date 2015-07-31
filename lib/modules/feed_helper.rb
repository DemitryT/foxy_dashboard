module FeedHelper
  def symbolize_keys(hash)
    hash.inject({}){|new_hash, key_value|
      key, value = key_value
      value = symbolize_keys(value) if value.is_a?(Hash)
      new_hash[key.to_sym] = value
      new_hash
    }
  end
end
