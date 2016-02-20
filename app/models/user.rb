class User < ActiveRecord::Base
  has_many :projects, -> { order(position: :asc) }
  has_many :tasks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
