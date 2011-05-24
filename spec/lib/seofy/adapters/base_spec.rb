require 'spec_helper' 

describe Seofy::Adapters::Base do 
  context "methods" do 
    subject { Seofy::Adapters::Base.new }

    it { should be_respond_to(:seofy_slug) }
    it { should be_respond_to(:set_seofy_slug) }
    it { should be_respond_to(:before_save) }
    it { should be_respond_to(:after_save) }
  end

  describe "#before_save" do
    it "should set_seofy_slug" do 
      adapter = Seofy::Adapters::Base.new
      adapter.should_receive(:set_seofy_slug)
      adapter.before_save("anything")
    end
  end

end

