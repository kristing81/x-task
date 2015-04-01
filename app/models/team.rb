class Team < ActiveRecord::Base
  has_many :tasks
  has_many :mutants

  validates :name, presence: true
end
