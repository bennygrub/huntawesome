task :weekly_reminder => :environment do
  User.all.each do |user|
    #ReminderMailer.weekly(user).deliver
  end
  user = User.find(2)
  ReminderMailer.weekly(user).deliver
end