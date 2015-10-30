class Wiki < ActiveRecord::Base
  belongs_to :user
  
  validates :title, length: { minimum: 1 }, presence: true
  validates :body, length: { minimum: 1 }, presence: true
end