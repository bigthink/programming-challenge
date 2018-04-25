class User < ApplicationRecord
  validates :name, presence: true
  has_many :usage
  has_many :videos, through: :usage
end
