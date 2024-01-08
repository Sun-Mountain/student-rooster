# frozen_string_literal: true

class ColorSwatchComponent < ViewComponent::Base
  def initialize(colorCode:,
                 colorCode50:,
                 colorCode30:,
                 textColor: 'rgba(73, 80, 87, 1)',
                 lightTextColor: 'rgba(73, 80, 87, 1)',
                 title: 'No Title')
    @colorCode = colorCode
    @colorCode50 = colorCode50
    @colorCode30 = colorCode30
    @lightTextColor = lightTextColor
    @title = title
  end
end
