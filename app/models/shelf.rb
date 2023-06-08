class Shelf < ApplicationRecord
  belongs_to :section
  has_many :book, dependent: :destroy
end
