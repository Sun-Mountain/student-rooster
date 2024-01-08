# frozen_string_literal: true

class ColorSwatchComponent < ViewComponent::Base
  def initialize(colorCode:, colorCode50:, colorCode30:, title:)
    @colorCode = colorCode
    @colorCode50 = colorCode50
    @colorCode30 = colorCode30
    @title = title
  end
end
