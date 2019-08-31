class Todo < ApplicationRecord
  has_many :todousers
  has_many :users, through: :todousers
end
