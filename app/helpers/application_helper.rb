# frozen_string_literal: true

module ApplicationHelper
  def current_class?(current_path)
    'active' if request.path == current_path
  end
end
