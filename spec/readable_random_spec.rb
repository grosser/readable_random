require 'spec/spec_helper'

describe ReadableRandom do
  describe :get do
    def set(size)
      set = []
      100.times{ set << ReadableRandom.get(size) }
      set
    end

    it "has the expected length" do
      set(7).map{|x|x.length}.uniq.should == [7]
    end

    it "is unique" do
      set = set(7)
      set.uniq.size.should == set.size
    end

    it "works for small numbers" do
      set(1).map{|x|x.length}.uniq.should == [1]
    end

    it "works for large numbers" do
      set(255).map{|x|x.length}.uniq.should == [255]
    end

    it "does not contain hard to read chars" do
      set = set(7)
      ReadableRandom::EXCLUDE.each do |ambiguouse_letter|
        (set * '').should_not include(ambiguouse_letter)
      end
    end
  end
end