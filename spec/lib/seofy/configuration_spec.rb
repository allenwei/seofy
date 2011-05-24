require 'spec_helper'

describe Seofy::Configuration do 
  describe "#initialize" do 
    it "should parse source, adapter and adapter options" do 
      params = {:source => :name, :adapter => :existing_column, :adapter_option => {:column => :id}}
      stub_adapter = Seofy::Adapters::Base.new
      Seofy::Adapters::ExistingColumn.should_receive(:new).with(params[:adapter_option]).and_return(stub_adapter)
      conf = Seofy::Configuration.new(params) 
      conf.source.should == :name 
      conf.adapter.should == stub_adapter
    end
  end
end
