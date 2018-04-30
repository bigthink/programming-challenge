# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

def seedUsage(video, user, time)
  @usage = Usage.create!(video_id: video.id, user_id: user.id, view_time: time)
  if !@usage.save
    throw `Could not save video_usage with errors: #{@usage.errors.full_messages}`
  end
end

def seedVideo
  @video = Video.create!(name: Faker::Name.name)
  if !@video.save
    throw `Could not save video with errors: #{@video.errors.full_messages}`
  end
end

def seedUser
  @user = User.create!(name: Faker::Name.name)
  if !@user.save
    throw `Could not save User with errors: #{@user.errors.full_messages}`
  end
end

def clearData
  Video.destroy_all
  User.destroy_all
  Usage.destroy_all
end

def seedFile
  clearData

  10.times do
    seedVideo()
    seedUser()
  end

  @myVideos = Video.all
  @myUsers = User.all
  Video.all.each do |vid|

    rand(750...1000).times do
      seedUsage(vid, @myUsers.sample, 25)
    end
    rand(500...750).times do
      seedUsage(vid, @myUsers.sample, 50)
    end
    rand(250...500).times do
      seedUsage(vid, @myUsers.sample, 75)
    end
    rand(1...250).times do
      seedUsage(vid, @myUsers.sample, 100)
    end
  end

end

seedFile()
