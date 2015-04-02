task :weekly_reminder => :environment do
  if Time.now.strftime("%A") == "Wednesday"
    User.all.each do |user|
      ReminderMailer.weekly(user).deliver
    end
  end
end