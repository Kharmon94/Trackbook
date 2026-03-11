class Track < ApplicationRecord
  belongs_to :project

  has_one_attached :cover_art
  has_one_attached :sketch

  validates :title, presence: true
  validates :track_number, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :track_number, uniqueness: { scope: :project_id }, allow_nil: true
end
