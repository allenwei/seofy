namespace :seofy do 
  desc "update all slug, specify models use ENV['MODELS']" 
  task :update_all => :environment do 
    Seofy::TaskRunner.new.update_all
  end
  desc "update null slug, specify models use ENV['MODELS']" 
  task :update_null => :environment do 
    Seofy::TaskRunner.new.update_null
  end
end
