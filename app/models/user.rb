class User < ApplicationRecord
  default_scope { order(created_at: :desc) }
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  attr_accessor :change_password

  validates :name, presence: true
end
