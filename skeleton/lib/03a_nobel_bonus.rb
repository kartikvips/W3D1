# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  p execute(<<-SQL)
    SELECT
      yr
    FROM

      (
        SELECT
          yr, subject
        FROM
          nobels
        WHERE
          subject IN ('Chemistry', 'Physics')
      ) AS phys
    GROUP BY
      subject
    HAVING
      count('Chemistry') = 0
  SQL
end
