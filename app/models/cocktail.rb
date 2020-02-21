# frozen_string_literal: true

# cocktails model (many-to-many relationship)
class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false
end
