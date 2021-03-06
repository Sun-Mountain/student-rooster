# frozen_string_literal: true

RSpec.feature 'creating and deleting unique rosters' do
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

    context 'student page' do
      scenario 'create and delete single unique roster' do
        visit team_student_path(@team.id, @student.id)

        expect(page.body).to have_content("This student has not been enrolled in any classes.")
        expect(@student.unique_rosters).to be_empty

        find('#unique_roster_lesson_id').find(:xpath, 'option[2]').select_option
        find('#unique_roster_roster_id').find(:xpath, 'option[2]').select_option
        find('[data-test="add-unique-roster"]').click

        expect(page.body).to have_content("Student added to Roster!")
        expect(@student.unique_rosters).not_to be_empty

        @unique_roster = @student.unique_rosters.first

        find("[data-test=\"delete-ur-#{@unique_roster.id}\"]").click

        expect(@student.unique_rosters).to be_empty
      end
    end
  end

  describe 'fail' do
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

    context 'student page' do
      scenario 'requires both lesson and roster' do
        visit team_student_path(@team.id, @student.id)

        expect(page.body).to have_content("This student has not been enrolled in any classes.")
        expect(@student.unique_rosters).to be_empty

        find('#unique_roster_lesson_id').find(:xpath, 'option[2]').select_option
        find('[data-test="add-unique-roster"]').click

        expect(page.body).to have_content("Student could not be added: Roster must exist")
        expect(@student.unique_rosters).to be_empty

        find('#unique_roster_roster_id').find(:xpath, 'option[2]').select_option
        find('[data-test="add-unique-roster"]').click

        expect(page.body).to have_content("Student could not be added: Lesson must exist")
        expect(@student.unique_rosters).to be_empty
      end
    end

    scenario 'unique roster must be unique' do
      visit team_student_path(@team.id, @student.id)

      expect(@student.unique_rosters.count).to eq(0)

      find('#unique_roster_lesson_id').find(:xpath, 'option[2]').select_option
      find('#unique_roster_roster_id').find(:xpath, 'option[2]').select_option
      find('[data-test="add-unique-roster"]').click

      expect(@student.unique_rosters.count).to eq(1)

      find('#unique_roster_lesson_id').find(:xpath, 'option[2]').select_option
      find('#unique_roster_roster_id').find(:xpath, 'option[2]').select_option
      find('[data-test="add-unique-roster"]').click

      expect(page.body).to have_content("Student could not be added: Student already enrolled.")
      expect(@student.unique_rosters.count).to eq(1)
    end
  end
end
