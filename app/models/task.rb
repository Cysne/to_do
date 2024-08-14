class Task < ApplicationRecord
  self.primary_key = 'id'
  belongs_to :schedule
  acts_as_list scope: :schedule
end
