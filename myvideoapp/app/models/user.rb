class User < ApplicationRecord
  has_many :usage
  has_many :videos, through: :usages
end
