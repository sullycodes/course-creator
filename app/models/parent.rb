class Parent < ApplicationRecord
    validates :name, presence: true
    has_one :student, dependent: :nullify 
    has_many :conferences
    has_many :teachers, through: :conferences
end
