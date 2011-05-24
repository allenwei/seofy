require 'spec_helper' 

describe Seofy::Adapters::ExistingColumn do 
  it "should get column from options" do 
    inst = Seofy::Adapters::ExistingColumn.new(:column => :id)  
    inst.column.should == :id 
  end


  describe "seofy_slug" do 
    it "should get seofy_slug from existing data" do 
      stub = Object.new
      stub.should_receive(:id).and_return(1)
      adapter = Seofy::Adapters::ExistingColumn.new(:column => :id)  
      adapter.seofy_slug(stub).should == 1
    end
  end

  describe "set_seofy_slug" do 
    it "should be false" do 
      adapter = Seofy::Adapters::ExistingColumn.new(:column => :id)  
      adapter.set_seofy_slug("anything").should be_false
    end
  end

end
