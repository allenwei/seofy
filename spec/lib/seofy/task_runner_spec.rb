require 'spec_helper'

describe Seofy::TaskRunner do 

  it "should raise exception if no env MODELS" do 
    lambda {
      Seofy::TaskRunner.new 
    }.should raise_error
  end

  describe "#update_all" do 
    it "should update all slugs" do
      s1 = Store.create!(:title => "store 1")
      slug1 = s1.slug
      ENV["MODELS"] = "Store" 
      Seofy::TaskRunner.new.update_all
      s1.reload.should_not == slug1
    end
    it "should ignore default_scope" do 
      s1 = Store.create!(:title => "store 1", :deleted => 1)
      slug1 = s1.slug
      ENV["MODELS"] = "Store" 
      Seofy::TaskRunner.new.update_all
      Store.unscoped.find(s1.id).slug.should_not == slug1
    end
  end

  describe "#update_null" do 
    it "should update all null slugs" do
      s1 = Store.create!(:title => "store 1")
      Store.connection.execute("update stores set slug = NULL")
      s1.reload.slug.should be_nil
      s2 = Store.create!(:title => "store 1")
      old_slug = s2.slug
      ENV["MODELS"] = "Store" 
      Seofy::TaskRunner.new.update_all
      s1.reload.should_not be_nil
      s2.reload.slug.should_not == old_slug
    end
  end
end
