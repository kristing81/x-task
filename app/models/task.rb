class Task < ActiveRecord::Base
  belongs_to :team

  validates :team_id, presence: true
   validates :description, presence: true
end
