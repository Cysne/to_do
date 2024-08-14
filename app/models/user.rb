# frozen_string_literal: true

# classe de usuário
class User < ApplicationRecord
  self.primary_key = 'id'
  has_many :schedules
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
