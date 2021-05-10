class LessonStudentLink < ApplicationRecord
  belongs_to :lesson
  belongs_to :student
end
