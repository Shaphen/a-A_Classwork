# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  SELECT
    physics.yr
  FROM
    nobels AS physics
  LEFT OUTER JOIN
    nobels AS chemistry
  ON physics.yr = chemistry.yr
  WHERE
    physics.subject='Chemistry' IS NULL
  SQL
end
