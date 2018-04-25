# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# need to write out a a seed file for distributed data
require 'faker'
require 'distribution'

def seedUsage(video, user)
  @distribution = Distribution::ChiSquare.cdf(Random.rand(), 1)
  @usage = Usage.create!(video_id: video.id, user_id: user.id, view_time: 100 * @distribution)
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
  100.times do
    seedUsage(@myVideos.sample, @myUsers.sample)
  end

end

seedFile()
