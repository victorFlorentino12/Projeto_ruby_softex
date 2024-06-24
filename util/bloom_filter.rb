require "murmurhash3"
require "cityhash"
require "ruby-xxhash"

class Bloom
  @@DEFAULT_K = [
    MurmurHash3::V32.method(:str_hash),
    CityHash.method(:hash32),
    lambda { |data| XXhash.xxh32(data, 40028922) },
  ]

  def initialize(data = [], k = @@DEFAULT_K)
    @k = k
    @bloom_filters = Array.new(@k.length) { |i| data[i].nil? ? 0 : data[i] }
  end

  def push(data)
    encode = apply_all_hashfunction(data)
    (0...@k.length).each { |i| @bloom_filters[i] |= encode[i] }
  end

  def include?(data)
    encode = apply_all_hashfunction(data)
    (0...encode.length).each do |i|
      return false if (@bloom_filters[i] & encode[i]) == 0
    end
    return true
  end

  private

  def apply_all_hashfunction(data)
    @k.map { |func| 0x01 << (func.call(data) % 1024) }
  end
end
