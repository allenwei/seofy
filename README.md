Seofy
====

A simple plugin make permalink for you records. 

Note: only supprt Rails 3


Installation
----- 

  gem install seofy 

Rails 3

  gem 'seofy'


Usage
-----

    # existing_column adapter
    class User < ActiveRecord::Base 
      seofy :source => :name, :adapter => :existing_column, :adapter_option => {:column => :slug}    
    end

    # base36 adapter
    class Store < ActiveRecord::Base 
      seofy :source => :title, :adapter => :base36, :adapter_option => {:length => 3, :column => :slug }
    end

    User.for_slug("SLUG")


Rake task 
-------- 

   rake seofy:update_all MODELS=User,Store

   rake seofy:update_null MODELS=User,Store
