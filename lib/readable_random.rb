require 'openssl'
require "base64"

class ReadableRandom
  VERSION = File.read( File.join(File.dirname(__FILE__),'..','VERSION') ).strip
  NON_READABLE = %w[o O 0 1 l / = +]

  def self.get(size)
    try = random_string(size * 2)
    try = try.split('').reject{|x| NON_READABLE.include? x}.join('')

    if try.length < size #too many excluded characters !?
      get(size) #try once again...
    else
      try[0...size]
    end
  end

  def self.hex(size)
    random_string(size).unpack("H*")[0][0...size]
  end

  def self.base64(size)
    random_string(size)[0...size]
  end

  private

  def self.random_string(size)
    [OpenSSL::Random.random_bytes(size)].pack("m*").delete("\n")
  end
end