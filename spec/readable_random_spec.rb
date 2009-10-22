require 'spec/spec_helper'

describe ReadableRandom do
  def set(method, size)
    set = []
    100.times{ set << ReadableRandom.send(method, size) }
    set
  end

  describe :get do
    it "has the expected length" do
      set(:get, 7).map{|x|x.length}.uniq.should == [7]
    end

    it "is unique" do
      set = set(:get, 7)
      set.uniq.size.should == set.size
    end

    it "works for small numbers" do
      set(:get, 1).map{|x|x.length}.uniq.should == [1]
    end

    it "works for large numbers" do
      set(:get, 255).map{|x|x.length}.uniq.should == [255]
    end

    it "does not contain hard to read chars" do
      set = set(:get, 7)
      ReadableRandom::NON_READABLE.each do |ambiguouse_letter|
        (set * '').should_not include(ambiguouse_letter)
      end
    end
  end

  describe :hex do
    it "has given length" do
      set(:hex, 5).map{|x| x.length}.uniq.should == [5]
    end

    it "contains the hex chars" do
      set(:hex, 5).map{|x| x.split('')}.flatten.uniq.sort.should == %w[0 1 2 3 4 5 6 7 8 9 a b c d e f]
    end
  end

  describe :base64 do
    it "has given length" do
      set(:base64, 5).map{|x| x.length}.uniq.should == [5]
    end

    it "contains the base64 chars" do
      base64_chars = (['+', '/'] + ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a)
      set(:base64, 5).map{|x| x.split('')}.flatten.uniq.sort.should == base64_chars
    end

  end
end