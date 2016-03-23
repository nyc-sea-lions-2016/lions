class Skill < ActiveRecord::Base
  has_many :sea_lion_skills
  has_many :sea_lions, through: :sea_lion_skills

  validates :name, presence: true
end
