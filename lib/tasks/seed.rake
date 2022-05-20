namespace :seed do

  desc "reset dev db"
  task :reset_dev_db do 
    Rake::Task['db:reset'].invoke
  end

  desc "reset prod db"
  task :reset_prod_db => :environment do
    User.destroy_all
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

  desc "seed scores"
  task :scores => :environment do
    Score.create([
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)},
      {value: rand(1..1000), date: DateTime.new(rand(2021..2022),rand(1..12),rand(1..28)), user_id: rand(1..6)}
    ])
  end

  desc "seed dev"
  task :dev do
    Rake::Task['seed:reset_dev_db'].invoke
    Rake::Task['seed:users'].invoke
  end

  desc "seed prod"
  task :prod do
    Rake::Task['seed:reset_prod_db'].invoke
    Rake::Task['seed:users'].invoke
  end

end
