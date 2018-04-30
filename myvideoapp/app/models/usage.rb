class Usage < ApplicationRecord
  validates :user_id, presence: true
  validates :video_id, presence: true
  belongs_to :video
  belongs_to :user
  validates_associated :video
  validates_associated :user
end
