namespace :seed do

  desc "reset dev db"
  task :reset_dev_db do 
    Rake::Task['db:reset'].invoke
  end

  desc "reset prod db"
  task :reset_prod_db, [:db_name] do 
    heroku pg:reset DATABASE
  end

  desc "seed users"
  task :users => :environment do
    User.create([
      {username: "mark", password: "password"},
      {username: "tim", password: "password"},
      {username: "jane", password: "password"},
      {username: "jim", password: "password"},
      {username: "horton", password: "password"},
      {username: "keanu", password: "password"}
    ])
  end

  desc "seed dev"
  task :dev do
    Rake::Task['seed:reset_dev_db'].invoke
    Rake::Task['seed:users'].invoke
  end

  desc "seed prod"
  task :prod do
    Rake::Task['seed:reset_prod_db'].invoke('markmcdapp125')
    Rake::Task['seed:users'].invoke
  end

end
