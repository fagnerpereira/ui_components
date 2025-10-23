# frozen_string_literal: true

# Table component - data display in rows and columns
#
# Usage:
#   Components::WindUI::Table.new(
#     headers: ["Name", "Email", "Role"],
#     rows: [
#       ["John Doe", "john@example.com", "Admin"],
#       ["Jane Smith", "jane@example.com", "User"]
#     ]
#   )
class Components::WindUI::Table < Components::WindUI::Base
  attr_reader :headers, :rows, :class_name

  def initialize(headers: [], rows: [], class_name: nil, **attrs)
    @headers = headers
    @rows = rows
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    component_class = [
      "w-full border-collapse border border-gray-200 rounded-lg overflow-hidden",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    table(class: component_class, **@attrs) do
      # Header
      thead(class: "bg-gray-50 border-b border-gray-200") do
        tr do
          headers.each do |header|
            th(class: "px-6 py-3 text-left text-sm font-semibold text-gray-900") do
              plain(header)
            end
          end
        end
      end

      # Body
      tbody do
        rows.each_with_index do |row, idx|
          tr_class = idx.even? ? "bg-white" : "bg-gray-50"
          tr(class: "#{tr_class} border-b border-gray-200 hover:bg-gray-100") do
            row.each do |cell|
              td(class: "px-6 py-3 text-sm text-gray-900") do
                plain(cell)
              end
            end
          end
        end
      end
    end
  end
end
