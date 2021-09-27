# frozen_string_literal: true

RSpec.feature 'redirection after deleting unique roster' do
  let!(:user) { create :user }
  let!(:team) { create :team }
  let!(:lesson) { create :lesson }
  let!(:student) { create :student }
  let!(:roster) { create :roster }

  describe 'success' do
    before(:each) do
      @team = create(:team)
      @lesson = create(:lesson)
      @student = create(:student)
      @roster = create(:roster)

      user.teams << @team
      @team.lessons << @lesson
      @lesson.rosters << @roster
      @team.students << @student
      sign_in user
    end

    context 'delete from student profile' do
      scenario 'redirects to student profile' do
        visit team_student_path(@team.id, @student.id)

        find('#unique_roster_lesson_id').find(:xpath, 'option[2]').select_option
        find('#unique_roster_roster_id').find(:xpath, 'option[2]').select_option
        find('[data-test="add-unique-roster"]').click

        expect(page.body).to have_content("Student added to Roster!")
        expect(@student.unique_rosters).not_to be_empty

        @unique_roster = @student.unique_rosters.first

        find("[data-test=\"delete-ur-#{@unique_roster.id}\"]").click

        expect(page.body).to have_content("Student removed from class.")
        expect(page.body).to have_content(@student.name)
        expect(page.body).to have_content(@student.contact)
      end
    end

    context 'delete from roster profile' do
      scenario 'redirects to roster profile' do
      end
    end
  end
end
