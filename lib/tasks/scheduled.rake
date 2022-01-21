namespace :scheduled do

  desc 'Weekly Statistics'
  task weekly_statistics: :environment do
    User.all.each do |user|
      ApplicationMailer.weekly_statistics(user).deliver!
    end
  end

end
