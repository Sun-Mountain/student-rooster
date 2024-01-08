# frozen_string_literal: true

class ColorSwatchComponent < ViewComponent::Base
  def initialize(color_code:,
                 color_code50:,
                 color_code30:,
                 light_text_color: 'rgba(73, 80, 87, 1)',
                 title: 'No Title')
    @color_code = color_code
    @color_code50 = color_code50
    @color_code30 = color_code30
    @light_text_color = light_text_color
    @title = title
  end
end
