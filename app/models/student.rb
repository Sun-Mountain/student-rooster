class Student < ApplicationRecord

  def no_students?
    count.zero?
  end
end
