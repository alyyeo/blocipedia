class Wiki < ActiveRecord::Base
  belongs_to :user
  
  scope :visible_to, ->(user) { user.standard? ? where(private: false) : all }
  
  validates :title, length: { minimum: 1 }, presence: true
  validates :body, length: { minimum: 1 }, presence: true
end
