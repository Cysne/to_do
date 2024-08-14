# frozen_string_literal: true

# classe de schedule
class Schedule < ApplicationRecord
  self.primary_key = 'id'

  has_many :tasks

  belongs_to :user
end
