# frozen_string_literal: true

# Showcase view displaying all UI components
class Views::ComponentsShowcase < Views::Base
  def view_template
    div(class: "bg-gray-50 min-h-screen") do
      # Hero
      render_hero

      # Main content
      div(class: "py-12 bg-white") do
        div(class: "max-w-6xl mx-auto px-4 sm:px-6 lg:px-8") do
          h1(class: "text-4xl font-bold text-gray-900 mb-12") { "UI Components Showcase" }

          # Component sections
          render_buttons
          render_badges
          render_alerts
          render_forms
          render_navigation
          render_data_display
          render_features
          render_sections
        end
      end

      # Footer
      render_footer
    end
  end

  private

  def render_hero
    section(class: "bg-gradient-to-r from-blue-600 to-blue-800 text-white py-16") do
      div(class: "max-w-4xl mx-auto px-4 text-center") do
        h2(class: "text-4xl font-bold mb-4") { "Beautiful UI Components" }
        p(class: "text-lg opacity-90") do
          plain("A comprehensive library of reusable Phlex components built with Tailwind CSS")
        end
      end
    end
  end

  def render_buttons
    render_section("Buttons", "button") do
      div(class: "grid grid-cols-2 md:grid-cols-4 gap-4") do
        %i[primary secondary danger success warning info outline ghost].each do |variant|
          div do
            render Components::WindUI::Button.new(
              text: variant.to_s.capitalize,
              variant: variant,
              size: :md
            )
          end
        end
      end
    end
  end

  def render_badges
    render_section("Badges", "badge") do
      div(class: "flex flex-wrap gap-3") do
        %i[primary secondary danger success warning info].each do |variant|
          render Components::WindUI::Badge.new(
            text: variant.to_s.capitalize,
            variant: variant,
            size: :md
          )
        end
      end
    end
  end

  def render_alerts
    render_section("Alerts", "alert") do
      div(class: "space-y-3") do
        [
          { variant: :success, title: "Success", message: "Operation completed successfully" },
          { variant: :danger, title: "Error", message: "Something went wrong" },
          { variant: :warning, title: "Warning", message: "Please review before proceeding" },
          { variant: :info, title: "Info", message: "Additional information for you" }
        ].each do |config|
          render Components::WindUI::Alert.new(**config)
        end
      end
    end
  end

  def render_forms
    render_section("Form Components", "form") do
      div(class: "grid md:grid-cols-2 gap-8") do
        # Left column
        div do
          render Components::WindUI::Input.new(
            label_text: "Email Address",
            type: "email",
            placeholder_text: "you@example.com",
            required: true
          )

          div(class: "mt-6") do
            render Components::WindUI::Textarea.new(
              label_text: "Message",
              placeholder_text: "Your message here...",
              rows: 4
            )
          end

          div(class: "mt-6") do
            render Components::WindUI::Select.new(
              label_text: "Choose an option",
              options: [ [ "Option 1", "1" ], [ "Option 2", "2" ], [ "Option 3", "3" ] ],
              placeholder_text: "Select..."
            )
          end
        end

        # Right column
        div do
          div do
            render Components::WindUI::Checkbox.new(label_text: "I agree to the terms")
          end

          div(class: "mt-4") do
            render Components::WindUI::Radio.new(label_text: "Option A", name: "choice", value: "a")
          end

          div(class: "mt-4") do
            render Components::WindUI::Radio.new(label_text: "Option B", name: "choice", value: "b")
          end

          div(class: "mt-6") do
            render Components::WindUI::Toggle.new(label_text: "Enable notifications", checked: true)
          end

          div(class: "mt-4") do
            render Components::WindUI::Spinner.new(size: :md)
          end
        end
      end
    end
  end

  def render_navigation
    render_section("Navigation", "navigation") do
      # Navbar
      div(class: "mb-8") do
        h3(class: "text-lg font-semibold text-gray-900 mb-4") { "Navbar" }
        render Components::WindUI::Navbar.new(
          brand: "MyApp",
          links: [ [ "Home", "/" ], [ "About", "/about" ], [ "Services", "/services" ] ]
        )
      end

      # Breadcrumb
      div(class: "mb-8") do
        h3(class: "text-lg font-semibold text-gray-900 mb-4") { "Breadcrumb" }
        render Components::WindUI::Breadcrumb.new(
          items: [ [ "Home", "/" ], [ "Products", "/products" ], [ "Electronics", nil ] ]
        )
      end

      # Tabs
      div(class: "mb-8") do
        h3(class: "text-lg font-semibold text-gray-900 mb-4") { "Tabs" }
        render Components::WindUI::Tabs.new(
          tabs: [
            { label: "Tab 1", content: "Content for tab 1" },
            { label: "Tab 2", content: "Content for tab 2" },
            { label: "Tab 3", content: "Content for tab 3" }
          ]
        )
      end

      # Pagination
      div do
        h3(class: "text-lg font-semibold text-gray-900 mb-4") { "Pagination" }
        div(class: "flex justify-center") do
          render Components::WindUI::Pagination.new(current_page: 2, total_pages: 5)
        end
      end
    end
  end

  def render_data_display
    render_section("Data Display", "data-display") do
      # Table
      div(class: "mb-8") do
        h3(class: "text-lg font-semibold text-gray-900 mb-4") { "Table" }
        render Components::WindUI::Table.new(
          headers: [ "Name", "Email", "Role" ],
          rows: [
            [ "John Doe", "john@example.com", "Admin" ],
            [ "Jane Smith", "jane@example.com", "User" ],
            [ "Bob Wilson", "bob@example.com", "Moderator" ]
          ]
        )
      end

      # Accordion
      div(class: "mb-8") do
        h3(class: "text-lg font-semibold text-gray-900 mb-4") { "Accordion" }
        render Components::WindUI::Accordion.new(
          items: [
            { title: "What is this?", content: "This is an accordion component for showing/hiding content." },
            { title: "How does it work?", content: "Click on each section to expand or collapse it." },
            { title: "Can I customize it?", content: "Yes, it can be styled with Tailwind CSS classes." }
          ]
        )
      end

      # List
      div do
        h3(class: "text-lg font-semibold text-gray-900 mb-4") { "List" }
        render Components::WindUI::List.new(
          items: [ "First item", "Second item", "Third item", "Fourth item" ]
        )
      end
    end
  end

  def render_features
    render_section("Feature Components", "features") do
      div(class: "grid md:grid-cols-3 gap-6 mb-8") do
        render Components::WindUI::FeatureCard.new(
          title: "Fast",
          description: "Lightning quick performance and loading times",
          icon: "⚡"
        )
        render Components::WindUI::FeatureCard.new(
          title: "Secure",
          description: "Enterprise-grade security and data protection",
          icon: "🔒"
        )
        render Components::WindUI::FeatureCard.new(
          title: "Reliable",
          description: "99.99% uptime guarantee and support",
          icon: "✓"
        )
      end

      # Testimonial
      div(class: "mb-8") do
        h3(class: "text-lg font-semibold text-gray-900 mb-4") { "Testimonial" }
        render Components::WindUI::TestimonialCard.new(
          quote: "This product has completely transformed our workflow. Highly recommended!",
          author: "Sarah Johnson",
          role: "Product Manager",
          rating: 5
        )
      end

      # Card
      div do
        h3(class: "text-lg font-semibold text-gray-900 mb-4") { "Card" }
        render Components::WindUI::Card.new(title: "Sample Card", subtitle: "With header and content") do
          p(class: "text-gray-700") do
            plain("This is a card component with a title, subtitle, and flexible content area.")
          end
        end
      end
    end
  end

  def render_sections
    render_section("Section Components", "sections") do
      # Stats
      div(class: "mb-8") do
        render Components::WindUI::StatsSection.new(
          title: "Our Impact",
          stats: [
            { label: "Happy Users", value: "10K+" },
            { label: "Active Projects", value: "500+" },
            { label: "Uptime", value: "99.9%" }
          ]
        )
      end

      # CTA
      div(class: "mb-8") do
        render Components::WindUI::CtaSection.new(
          title: "Ready to get started?",
          description: "Join thousands of satisfied users today",
          button_text: "Get Started Free",
          button_href: "/signup"
        )
      end

      # Pricing
      div(class: "mb-8") do
        h3(class: "text-lg font-semibold text-gray-900 mb-6") { "Pricing" }
        render Components::WindUI::PricingTable.new(
          plans: [
            {
              name: "Starter",
              price: "$29/mo",
              description: "Perfect for individuals",
              features: [ "Feature 1", "Feature 2", "Feature 3" ],
              button_text: "Get Started"
            },
            {
              name: "Professional",
              price: "$79/mo",
              description: "For growing teams",
              features: [ "All Starter features", "Advanced analytics", "Priority support" ],
              button_text: "Choose Plan",
              featured: true
            },
            {
              name: "Enterprise",
              price: "Custom",
              description: "For large organizations",
              features: [ "Custom everything", "Dedicated support", "SLA included" ],
              button_text: "Contact Sales"
            }
          ]
        )
      end
    end
  end

  def render_footer
    render Components::WindUI::Footer.new(
      brand: "UI Components",
      sections: [
        {
          title: "Product",
          links: [ [ "Features", "#" ], [ "Pricing", "#" ], [ "Security", "#" ] ]
        },
        {
          title: "Company",
          links: [ [ "About", "#" ], [ "Blog", "#" ], [ "Careers", "#" ] ]
        },
        {
          title: "Legal",
          links: [ [ "Privacy", "#" ], [ "Terms", "#" ], [ "Cookies", "#" ] ]
        }
      ]
    )
  end

  def render_section(title, anchor)
    div(class: "mb-16", id: anchor) do
      h2(class: "text-3xl font-bold text-gray-900 mb-8 pb-4 border-b border-gray-200") do
        plain(title)
      end
      yield
    end
  end
end
