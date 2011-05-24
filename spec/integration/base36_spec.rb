require 'spec_helper'

describe "slug use base36", :integration => true do 
  before(:all) do 
    @store = Store.create!(:title => "a store") 
  end
  it "should generate slug automaticly use base36"  do 
    @store.slug.length.should == 3 
    @store.seofy_param.should == "a-store-#{@store.slug}"
  end

  describe "for_slug" do 
    it "should find the record" do 
      Store.for_seofy(@store.seofy_param).should == @store
    end
  end

end
