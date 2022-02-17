class User < ApplicationRecord::Base
  has_many :transactions
end