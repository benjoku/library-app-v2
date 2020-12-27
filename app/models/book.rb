class Book < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  validates :author, presence: true
end
