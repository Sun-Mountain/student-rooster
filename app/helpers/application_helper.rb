# frozen_string_literal: true

module ApplicationHelper
  def current_class?(test_path)
    'active' if request.path == test_path
  end
end
