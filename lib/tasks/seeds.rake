namespace :seeds do
  
  desc "seed users"
  task :users do

    # delete the old database & create a new one
    Rake::Task['db:reset'].invoke

    # create users
    User.create([
      {username: "mark", password: "password"},
      {username: "tim", password: "password"},
      {username: "jane", password: "password"},
      {username: "jim", password: "password"},
      {username: "horton", password: "password"},
      {username: "keanu", password: "password"}
    ])

  end

end
