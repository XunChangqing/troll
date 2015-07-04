class Task < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  belongs_to :checker, :class_name => 'User'
end
