module Seofy
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/seofy.rake"
    end
  end
end
