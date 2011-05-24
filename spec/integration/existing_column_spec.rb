require 'spec_helper'

describe "slug for existing_column", :integration => true do 
  before(:all) do 
    @user = User.create!(:name => "a user name", :slug => "slug")
  end

  describe "to_param" do 
    it "should equal to combined slugs" do 
      @user.seofy_param.should == "a-user-name-slug"
    end
  end

  describe "for_slug" do 
    it "should find the record" do 
      User.for_seofy(@user.seofy_param).should == @user
    end
  end
end
