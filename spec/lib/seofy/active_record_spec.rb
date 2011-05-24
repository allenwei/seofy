require 'spec_helper'

describe Seofy::ActiveRecord  do
  context "after mxin ActiveRecord::Base" do 
    it "should have class method :seofy" do
      ActiveRecord::Base.should be_respond_to(:seofy)
    end
  end
  context "a class extend Seofy::ActiveRecord::ClassMethods" do 
    before(:each) do 
      @klass = Class.new 
      @klass.extend Seofy::ActiveRecord::ClassMethods
      @klass.should_receive(:init_seofy_config)
      @klass.should_receive(:after_save)
      @klass.should_receive(:before_save)
      @klass.seofy
    end

    context "klass methods" do 
      subject { @klass }
      it { should be_respond_to(:seofy) }

      describe "seofy_adapter" do
        it "should get adapter from config" do 
          @klass.should_receive(:seofy_config).and_return double(:adapter => "dummy adapter")
          @klass.seofy_adapter
        end
      end

      describe "for_slug" do 
        it "should get slug from id and find record use it" do 
          @klass.should_receive(:seofy_adapter).and_return double(:column => "id") 
          @klass.should_receive("find_by_id").with("123")
          @klass.for_seofy("a-b-c-123")
        end
      end
    end

    context "instance methods" do 
      subject {@klass.new } 
      it { should be_respond_to(:to_param)}
      it { should be_respond_to(:seofy_slug)}
      it { should be_respond_to(:seofy_source)}
    end

    describe "#seofy_source" do 
      it "will get source from inst" do 
        inst = @klass.new 
        @klass.should_receive(:seofy_config).and_return double(:source =>:name)  
        inst.should_receive(:name).and_return("a name") 
        inst.seofy_source.should == "a name"
      end
    end

    describe "#seofy_slug" do 
      it "should get seofy_slug from adapter" do 
        inst = @klass.new 
        @klass.should_receive(:seofy_adapter).and_return double(:seofy_slug => "abc")
        inst.seofy_slug.should == "abc"
      end
    end

    describe "#to_param" do 
      it "should normalize source and join with slug" do 
        inst = @klass.new 
        inst.should_receive(:seofy_slug).and_return("abc")
        inst.should_receive(:seofy_source).and_return("a normalize name")
        inst.to_param.should == "a-normalize-name-abc"
      end
    end

    it "should ask adapter handle callback" do 
      inst = @klass.new 
      @klass.should_receive(:seofy_adapter).and_return double(:before_save => true)
      @klass.should_receive(:seofy_adapter).and_return double(:after_save => true)
      inst.seofy_before_save
      inst.seofy_after_save
    end
  end
end
