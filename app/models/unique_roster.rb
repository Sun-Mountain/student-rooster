class UniqueRoster < ApplicationRecord
  has_many :unique_rosters_links
  has_many :lessons, through: :unique_rosters_links
  has_many :rosters, through: :unique_rosters_links
  has_many :students, through: :unique_rosters_links
end
