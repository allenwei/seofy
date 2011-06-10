# existing_column adapter
class User < ActiveRecord::Base 
  seofy :source => :name, :adapter => :existing_column, :adapter_option => {:column => :slug}    
end

# base36 adapter
class Store < ActiveRecord::Base 
  seofy :source => :title, :adapter => :base36, :adapter_option => {:length => 3, :column => :slug }
  default_scope where("stores.deleted = 0")
end
