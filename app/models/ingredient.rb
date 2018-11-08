class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails

  validates :name, presence: true, uniqueness: true

end
