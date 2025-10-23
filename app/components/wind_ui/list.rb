# frozen_string_literal: true

# List component - displays items in a list format
#
# Usage:
#   Components::WindUI::List.new(
#     items: ["Item 1", "Item 2", "Item 3"],
#     ordered: false
#   )
class Components::WindUI::List < Components::WindUI::Base
  attr_reader :items, :ordered, :class_name

  def initialize(items: [], ordered: false, class_name: nil, **attrs)
    @items = items
    @ordered = ordered
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    list_class = [
      "space-y-2",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    list_tag = ordered ? :ol : :ul

    send(list_tag, class: list_class, **@attrs) do
      items.each do |item|
        li(class: "text-gray-700 flex items-start") do
          span(class: "mr-3 text-gray-400") do
            plain(ordered ? "•" : "•")
          end
          plain(item)
        end
      end
    end
  end
end
