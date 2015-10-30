class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_initialize { self.role = :standard}
         
  has_many :wikis
  
  enum role: [:standard, :premium, :admin]
  
  def name
    self.email.split('@')[0]
  end
  
  protected
  def confirmation_required?
    false
  end
end