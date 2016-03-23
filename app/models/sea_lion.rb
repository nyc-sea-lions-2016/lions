class SeaLion < ActiveRecord::Base
  has_many :sea_lion_skills
  has_many :skills, through: :sea_lion_skills

  validates :name, :ocean, presence: true
end
