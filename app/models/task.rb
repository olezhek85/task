class Task < ActiveRecord::Base
  belongs_to   :project
  belongs_to   :user
  acts_as_list scope: :project

  validates    :name,    presence: true, allow_blank: false
  validates    :project, presence: true, allow_blank: false
end
