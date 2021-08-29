class UniqueRoster < ApplicationRecord
  belongs_to :student
  belongs_to :roster
  belongs_to :lesson

  before_create :validate_uniqueness

  def validate_uniqueness
    @unique_rosters = UniqueRoster.all

    @student_id = student.id
    @roster_id = roster.id
    @lesson_id = lesson.id

    unless unique_roster_unique?(@unique_rosters, @student_id, @roster_id, @lesson_id)
      uniq_error("Student already enrolled.")
      throw(:abort)
    end
  end

  private

  def uniq_error(msg)
    errors.add(:base, msg)
  end

  def unique_roster_unique?(rosters, student, roster, lesson)
    x = rosters.find {|i| i["student_id"] == student and i["roster_id"] == roster and i["lesson_id"] == lesson}
    x.nil?
  end
end
