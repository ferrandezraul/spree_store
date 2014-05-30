namespace :db do

  desc "drop, migrate and seed"
  task :setup_new do
    puts "You are dropping, migrating and seeding in #{Rails.env} environment"
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end

end