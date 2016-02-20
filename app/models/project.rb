class Project < ActiveRecord::Base
  belongs_to   :user
  has_many     :tasks, -> { order( position: :asc ) }
  acts_as_list scope: :user

  validates    :user, presence: true, allow_blank: false
  validates    :name, presence: true, allow_blank: false
end
