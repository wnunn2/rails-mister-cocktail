# frozen_string_literal: true

# doses model (join table)
class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true, allow_blank: false
  validates_uniqueness_of :cocktail, scope: :ingredient
end
