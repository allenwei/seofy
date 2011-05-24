Seofy
====

A simple plugin make permalink for you records. 

Note: only supprt Rails 3

![travis-ci](http://travis-ci.org/allenwei/seofy.png)

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

    User.for_seofy("SLUG")

and we won't override `to_param` method, we create new one `seofy_param` 

   user = User.create(:name => "I am allen", :slug => "abc") 
   user.seofy_param #=>  "i-am-allen-abc"


Rake task 
-------- 

   rake seofy:update_all MODELS=User,Store

   rake seofy:update_null MODELS=User,Store
