# frozen_string_literal: true

RSpec.feature 'creating and updating students' do
  let!(:user) { create :user }
  let!(:team) { create :team }

  before(:each) do
    user.teams << team
    sign_in user
    visit team_students_url(team.id)
  end

  context 'success' do
    scenario 'create, read, and edit lesson' do
      expect(page).to have_content("There are no students enrolled in #{team.name}")

      fill_in :student_first_name, with: 'William'
      fill_in :student_last_name, with: 'Riker'
      fill_in :student_contact, with: 'riker@gmail.com'

      find('[data-test="create-student"]').click

      last_student = Student.last

      expect(page.body).to include("William")
      expect(page.body).to include("Riker")
      expect(page.body).to include("delete-student-#{last_student.id}")

      find("[data-test=\"edit-student-#{last_student.id}\"]").click

      expect(page).to have_content(last_student.name)
      expect(page).to have_content(last_student.contact)
      expect(page).to have_content("Edit Student Name or Contact")

      find('[data-test="edit-student"]').click

      fill_in :student_first_name, with: 'Bill'
      find('[data-test="update-student"]').click

      expect(page).to have_content('Bill Riker')
    end
  end
end