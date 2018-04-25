class Video < ApplicationRecord
  validates :name, presence: true
  has_many :usages
  has_many :users, through: :usages
end
