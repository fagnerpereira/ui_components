# frozen_string_literal: true

class Views::ComponentsInteractiveShowcase < Views::Base
  def view_template
    div(class: "min-h-screen bg-gray-50", data: { controller: "dark_mode" }) do
      # Header with search and dark mode
      render_header

      div(class: "flex") do
        # Sidebar with navigation
        render_sidebar

        # Main content area
        div(class: "flex-1 overflow-auto") do
          div(class: "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12") do
            # Form Components Section
            render_form_components

            # UI Components Section
            render_ui_components

            # Layout Components Section
            render_layout_components

            # Navigation Components Section
            render_navigation_components

            # Data Display Section
            render_data_display_components

            # Feature Components Section
            render_feature_components
          end
        end
      end
    end
  end

  private

  def render_header
    header(class: "bg-white border-b border-gray-200 sticky top-0 z-50 shadow-sm dark:bg-gray-900 dark:border-gray-700") do
      div(class: "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-20 flex items-center justify-between") do
        div(class: "flex items-center gap-4 flex-1") do
          span(class: "text-3xl") { "🎨" }
          h1(class: "text-2xl font-bold text-gray-900 dark:text-white") { "Components Showcase" }

          # Search bar
          div(
            class: "hidden md:flex items-center gap-2 ml-auto mr-auto bg-gray-100 dark:bg-gray-800 rounded-lg px-4 py-2 max-w-xs",
            data: {
              controller: "component_search",
              component_search_target: "searchContainer"
            }
          ) do
            span(class: "text-gray-500") { "🔍" }
            input(
              type: "text",
              placeholder: "Search components...",
              class: "bg-transparent border-0 outline-none text-sm flex-1 dark:text-white dark:placeholder-gray-400",
              data: {
                component_search_target: "searchInput",
                action: "input->component_search#search keydown->component_search#handleKeydown"
              }
            )
          end
        end

        nav(class: "flex items-center gap-4") do
          # Dark mode toggle
          button(
            type: "button",
            class: "p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors",
            data: {
              controller: "dark_mode",
              action: "click->dark_mode#toggle",
              dark_mode_target: "button"
            },
            title: "Toggle dark mode"
          ) do
            span(class: "text-xl", data: { dark_mode_target: "icon" }) { "🌙" }
          end

          # Back link
          a(
            href: "/components",
            class: "text-sm text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white transition-colors"
          ) do
            plain("← Basic View")
          end
        end
      end
    end
  end

  def render_sidebar
    aside(class: "w-64 bg-white border-r border-gray-200 sticky top-20 h-[calc(100vh-5rem)] overflow-y-auto dark:bg-gray-900 dark:border-gray-700") do
      nav(class: "p-6 space-y-8") do
        render_sidebar_section("Form Components", "📝", "form")
        render_sidebar_section("UI Components", "🎨", "ui")
        render_sidebar_section("Layout", "📐", "layout")
        render_sidebar_section("Navigation", "🧭", "nav")
        render_sidebar_section("Data Display", "📊", "data")
        render_sidebar_section("Features", "✨", "features")
      end
    end
  end

  def render_sidebar_section(title, icon, anchor)
    div do
      a(
        href: "\##{anchor}",
        class: "flex items-center gap-2 text-gray-700 hover:text-blue-600 dark:text-gray-300 dark:hover:text-blue-400 transition-colors"
      ) do
        span(class: "text-lg") { icon }
        span(class: "font-medium text-sm") { title }
      end
    end
  end

  def render_form_components
    render_section("Form Components", "📝", "form") do
      render_component("Input", "input") do
        render Components::WindUI::Input.new(
          label_text: "Email Address",
          placeholder_text: "you@example.com",
          type: "email"
        )
      end

      render_component("Textarea", "textarea") do
        render Components::WindUI::Textarea.new(
          label_text: "Message",
          placeholder_text: "Enter your message...",
          rows: 4
        )
      end

      render_component("Select", "select") do
        render Components::WindUI::Select.new(
          label_text: "Choose option",
          options: [["Option 1", "1"], ["Option 2", "2"], ["Option 3", "3"]],
          placeholder_text: "Select..."
        )
      end

      render_component("Checkbox", "checkbox") do
        render Components::WindUI::Checkbox.new(
          label_text: "I agree to the terms and conditions"
        )
      end

      render_component("Radio", "radio") do
        div(class: "space-y-3") do
          render Components::WindUI::Radio.new(label_text: "Option A", name: "choice", value: "a")
          render Components::WindUI::Radio.new(label_text: "Option B", name: "choice", value: "b")
          render Components::WindUI::Radio.new(label_text: "Option C", name: "choice", value: "c")
        end
      end

      render_component("Toggle", "toggle") do
        div(class: "space-y-4") do
          render Components::WindUI::Toggle.new(label_text: "Enable notifications", checked: true)
          render Components::WindUI::Toggle.new(label_text: "Enable dark mode", checked: false)
        end
      end
    end
  end

  def render_ui_components
    render_section("UI Components", "🎨", "ui") do
      render_component("Button", "button") do
        div(class: "flex gap-3 flex-wrap") do
          %i[primary secondary danger success warning info].each do |variant|
            render Components::WindUI::Button.new(
              text: variant.to_s.capitalize,
              variant: variant,
              size: :md
            )
          end
        end
      end

      render_component("Badge", "badge") do
        div(class: "flex gap-2 flex-wrap") do
          %i[primary secondary danger success warning info].each do |variant|
            render Components::WindUI::Badge.new(
              text: variant.to_s.capitalize,
              variant: variant,
              size: :md
            )
          end
        end
      end

      render_component("Alert", "alert") do
        div(class: "space-y-3") do
          render Components::WindUI::Alert.new(variant: :success, title: "Success", message: "Operation completed successfully")
          render Components::WindUI::Alert.new(variant: :info, title: "Information", message: "This is an informational message")
        end
      end

      render_component("Spinner", "spinner") do
        div(class: "flex gap-6 items-center justify-center py-8") do
          render Components::WindUI::Spinner.new(size: :sm)
          render Components::WindUI::Spinner.new(size: :md)
          render Components::WindUI::Spinner.new(size: :lg)
        end
      end
    end
  end

  def render_layout_components
    render_section("Layout Components", "📐", "layout") do
      render_component("Card", "card") do
        render Components::WindUI::Card.new(title: "Card Title", subtitle: "Subtitle or description") do
          p(class: "text-gray-700 dark:text-gray-300") do
            plain("This is the main content area of the card component.")
          end
        end
      end

      render_component("Hero", "hero") do
        render Components::WindUI::Hero.new(
          title: "Welcome to Our Platform",
          subtitle: "Build amazing things with powerful components"
        )
      end
    end
  end

  def render_navigation_components
    render_section("Navigation", "🧭", "nav") do
      render_component("Breadcrumb", "breadcrumb") do
        render Components::WindUI::Breadcrumb.new(
          items: [["Home", "/"], ["Components", "/components"], ["Breadcrumb", nil]]
        )
      end
    end
  end

  def render_data_display_components
    render_section("Data Display", "📊", "data") do
      render_component("Table", "table") do
        render Components::WindUI::Table.new(
          headers: ["Name", "Email", "Role", "Status"],
          rows: [
            ["John Doe", "john@example.com", "Admin", "Active"],
            ["Jane Smith", "jane@example.com", "User", "Active"],
            ["Bob Wilson", "bob@example.com", "Moderator", "Inactive"]
          ]
        )
      end

      render_component("List", "list") do
        render Components::WindUI::List.new(
          items: ["First item", "Second item", "Third item", "Fourth item"]
        )
      end
    end
  end

  def render_feature_components
    render_section("Feature Components", "✨", "features") do
      render_component("Feature Card", "feature_card") do
        div(class: "grid grid-cols-3 gap-4") do
          render Components::WindUI::FeatureCard.new(title: "Fast", description: "Lightning fast", icon: "⚡")
          render Components::WindUI::FeatureCard.new(title: "Secure", description: "Enterprise security", icon: "🔒")
          render Components::WindUI::FeatureCard.new(title: "Reliable", description: "99.9% uptime", icon: "✓")
        end
      end

      render_component("Testimonial", "testimonial_card") do
        render Components::WindUI::TestimonialCard.new(
          quote: "This component library has transformed how we build UIs!",
          author: "Sarah Johnson",
          role: "Product Manager",
          rating: 5
        )
      end
    end
  end

  def render_section(title, icon, anchor)
    section(class: "mb-16", id: anchor) do
      div(class: "mb-8") do
        div(class: "flex items-center gap-3 mb-2") do
          span(class: "text-3xl") { icon }
          h2(class: "text-3xl font-bold text-gray-900 dark:text-white") { title }
        end
      end
      yield
    end
  end

  def render_component(title, component_name)
    code_content = get_component_code(component_name)
    highlighted_code = highlight_code(code_content)

    div(
      class: "bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden hover:shadow-md transition-shadow mb-6",
      data: {
        controller: "code_toggle",
        code_toggle_code_value: code_content
      }
    ) do
      # Preview section
      div(class: "p-8 bg-gradient-to-br from-gray-50 to-white dark:from-gray-900 dark:to-gray-800 min-h-[200px] border-b border-gray-200 dark:border-gray-700 flex items-center justify-center") do
        yield
      end

      # Info section
      div(class: "p-6 space-y-4") do
        h3(class: "text-lg font-semibold text-gray-900 dark:text-white") { title }

        # Buttons
        div(class: "flex gap-3 pt-2") do
          button(
            type: "button",
            class: "px-4 py-2 text-sm font-medium text-blue-600 dark:text-blue-400 border border-blue-600 dark:border-blue-400 rounded-lg hover:bg-blue-50 dark:hover:bg-blue-900/20 transition-colors",
            data: {
              code_toggle_target: "button",
              action: "click->code_toggle#toggle"
            }
          ) do
            plain("View Code")
          end

          button(
            type: "button",
            class: "px-4 py-2 text-sm font-medium text-gray-700 dark:text-gray-300 border border-gray-300 dark:border-gray-600 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors",
            data: { action: "click->code_toggle#copy" }
          ) do
            plain("Copy")
          end
        end

        # Code block (hidden by default)
        div(
          class: "hidden opacity-0 scale-y-95 transition-all duration-200 origin-top mt-4",
          data: { code_toggle_target: "codeBlock" }
        ) do
          div(class: "bg-gray-900 dark:bg-gray-950 rounded-lg overflow-x-auto") do
            pre(class: "text-xs leading-relaxed text-gray-100 p-4 font-mono") do
              plain highlighted_code
            end
          end
        end
      end
    end
  end

  def get_component_code(component_name)
    file_path = Rails.root.join("app/components/wind_ui/#{component_name}.rb")
    File.read(file_path) if File.exist?(file_path)
  rescue StandardError
    "# Component code not found"
  end

  def highlight_code(code)
    require "rouge"
    require "rouge/formatters/html"

    lexer = Rouge::Lexers::Ruby.new
    formatter = Rouge::Formatters::HTMLInline.new(style: "monokai")
    formatter.format(lexer.lex(code))
  rescue StandardError
    CGI.escapeHTML(code)
  end
end
