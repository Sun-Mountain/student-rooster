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

  context 'fail' do
    scenario 'cannot create student' do
      expect(page).to have_content("There are no students enrolled in #{team.name}")

      find('[data-test="create-student"]').click

      expect(page).to have_content("Student could not be added: First name can't be blank, Last name can't be blank, Contact can't be blank")
    end

    scenario 'cannot edit student' do
      student = create(:student)
      user.teams << student.team

      visit edit_team_student_path(student.team.id, student.id)

      expect(page).to have_content("Edit Student Name or Contact")

      fill_in :student_first_name, with: ''
      fill_in :student_last_name, with: ''
      fill_in :student_contact, with: ''

      find('[data-test="update-student"]').click

      expect(page).to have_content("Student could not be updated: First name can't be blank, Last name can't be blank, Contact can't be blank")
    end
  end
end