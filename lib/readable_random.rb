require 'openssl'

class ReadableRandom
  EXCLUDE = %w[o O 0 1 l / = +]

  def self.get(size)
    try = random_string(size * 2)
    try = try.split('').reject{|x| EXCLUDE.include? x}.join('')

    if try.length < size #too many excluded characters !?
      get(size) #try once again...
    else
      try[0...size]
    end
  end

  private

  def self.random_string(size)
    [OpenSSL::Random.random_bytes(size)].pack("m*").delete("\n")
  end
end