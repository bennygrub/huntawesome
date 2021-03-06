task :weekly_reminder => :environment do
  if Time.now.strftime("%A") == "Wednesday"
    User.all.each do |user|
      ReminderMailer.weekly(user.id).deliver
    end
  end
end

task :weekly_feature => :environment do
  if Time.now.strftime("%A") == "Friday"
    User.all.each do |user|
      ReminderMailer.suggested(user.id).deliver
    end
  end
end