module Refinery
  class ContentsGenerator < Rails::Generators::Base

    def rake_db
      rake "refinery_contents:install:migrations"
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Contents extension
Refinery::Contents::Engine.load_seed
        EOH
      end
    end
  end
end
