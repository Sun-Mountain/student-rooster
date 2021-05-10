# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @students = Student.all
  end
end