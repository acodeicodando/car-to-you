class User < ApplicationRecord
  default_scope { order(created_at: :desc) }
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :name, presence: true
end
