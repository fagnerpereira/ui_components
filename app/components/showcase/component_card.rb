# frozen_string_literal: true

module Showcase
  class ComponentCard < Phlex::HTML
    attr_reader :title, :description, :code, :preview_component

    def initialize(title:, description: nil, code:, preview: nil)
      @title = title
      @description = description
      @code = code
      @preview_component = preview
    end

    def view_template
      div(class: "border border-gray-200 rounded-lg overflow-hidden bg-white hover:shadow-md transition-shadow") do
        # Preview section
        div(class: "p-8 bg-gradient-to-br from-gray-50 to-white min-h-[200px] border-b border-gray-200") do
          if @preview_component
            render @preview_component
          else
            div(class: "text-center text-gray-500") do
              plain("No preview available")
            end
          end
        end

        # Component info and code section
        div(class: "p-6 space-y-4") do
          # Title and description
          div do
            h3(class: "text-lg font-semibold text-gray-900") { plain(@title) }
            if @description.present?
              p(class: "text-sm text-gray-600 mt-1") { plain(@description) }
            end
          end

          # Control buttons
          div(
            class: "flex gap-3 pt-2",
            data: {
              controller: "code-toggle",
              code_toggle_code_value: @code,
              code_toggle_language_value: "ruby"
            }
          ) do
            button(
              type: "button",
              class: "px-4 py-2 text-sm font-medium text-blue-600 border border-blue-600 rounded-lg hover:bg-blue-50 transition-colors",
              data: { code_toggle_target: "button", action: "click->code-toggle#toggle" }
            ) do
              plain("View Code")
            end

            button(
              type: "button",
              class: "px-4 py-2 text-sm font-medium text-gray-700 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors",
              data: { action: "click->code-toggle#copy" }
            ) do
              plain("Copy")
            end
          end

          # Code block (hidden by default)
          div(
            class: "hidden opacity-0 scale-y-95 transition-all duration-200 origin-top",
            data: { code_toggle_target: "codeBlock" }
          ) do
            div(class: "bg-gray-900 text-gray-100 rounded-lg p-4 overflow-x-auto mt-4") do
              pre(class: "text-xs leading-relaxed") do
                code(
                  class: "language-ruby",
                  data: { code_toggle_target: "code" }
                )
              end
            end
          end
        end
      end
    end
  end
end
