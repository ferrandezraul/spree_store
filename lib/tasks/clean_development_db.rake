namespace :db do

  desc "drop, migrate and seed"
  task :test_setup_new do
    puts "You are dropping, migrating and seeding in #{Rails.env} environment"

    #Rake::Task['db:drop'].invoke
    #Rake::Task['db:create'].invoke
    #Rake::Task['db:migrate'].invoke
    #Rake::Task['db:seed'].invoke

    system("rake db:drop RAILS_ENV=test")
    system("rake db:create RAILS_ENV=test")
    system("rake db:migrate RAILS_ENV=test")
    system("rake db:seed RAILS_ENV=test")
  end

end