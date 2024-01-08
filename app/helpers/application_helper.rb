# frozen_string_literal: true

module ApplicationHelper

  def current_class?(test_path)
    return 'active' if request.path == test_path
  end
end
