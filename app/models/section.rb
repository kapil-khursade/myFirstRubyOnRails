class Section < ApplicationRecord
    has_many :shelf, dependent: :destroy
end
