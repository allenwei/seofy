require 'spec_helper'

describe Seofy::Adapters::Base36 do 
  describe "#initialize" do 
    let(:adapter) { Seofy::Adapters::Base36.new(:length => 3, :column => :slug) } 

    it { adapter.length.should == 3 }
    it { adapter.column.should == :slug }

    describe "#set_seofy_slug" do 
      it "should generate random 3 characters" do 
        stub = Object.new 
        ::Seofy::Encoders::Base36.should_receive(:random).with(3).and_return("abc")
        stub.should_receive("slug=").with("abc")
        adapter.set_seofy_slug(stub)
      end
    end

    describe "#seofy_slug" do 
      it "should equal to slug column" do 
        stub = Object.new 
        stub.should_receive(:slug).and_return("abc")
        adapter.seofy_slug(stub).should == "abc"
      end
    end
  end
end
