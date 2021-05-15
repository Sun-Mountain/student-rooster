# frozen_string_literal: true

RSpec.feature 'deleting lessons' do
  let!(:user) { create :user }

  before(:each) do
    sign_in user
    visit root_path
  end

  context 'success' do
    scenario 'from student index page' do
      team = create(:team)
      user.teams << team
      student = create(:student, team_id: team.id)

      visit team_students_path(team.id)

      expect(page).to have_content(student.first_name)
      expect(page).to have_content(student.last_name)

      find("[data-test=\"delete-student-#{student.id}\"]").click

      expect(page).not_to have_content(student.first_name)
      expect(page).not_to have_content(student.last_name)
    end

    scenario 'from student profile' do
      team = create(:team)
      user.teams << team
      student = create(:student, team_id: team.id)

      visit team_student_path(team.id, student.id)

      expect(page).to have_content(student.name)

      find('[data-test="delete-student"]').click

      expect(page).to have_content("Student deleted.")
      expect(page).not_to have_content(student.name)
    end
  end
end