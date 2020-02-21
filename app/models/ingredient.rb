# frozen_string_literal: true

# ingredients model (many-to-many relationship)
class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses
  validates :name, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false
end
