# WindUI Components Library

A comprehensive, production-ready UI component library built with **Phlex** and **Tailwind CSS 4.x** for Ruby on Rails 8.1+.

## Overview

WindUI provides a collection of 30+ reusable, accessible, and highly customizable components designed for building modern web applications. Built with Phlex for efficient server-side rendering and Tailwind CSS for beautiful, responsive styling.

## Features

- **30+ Components**: Form inputs, buttons, cards, navigation, data display, and more
- **Phlex-First**: Components built with Phlex for optimal Rails integration
- **Tailwind CSS**: Fully styled with Tailwind CSS 4.x
- **Accessible**: ARIA attributes and semantic HTML
- **Responsive**: Mobile-first, responsive design
- **Type-Safe**: Instance variables and proper naming conventions
- **Well-Tested**: Minitest test suite for all components
- **Easy Customization**: Support for variants, sizes, and custom classes

## Installation

### Requirements

- Ruby 3.2+
- Rails 8.1+
- Tailwind CSS 4.x
- Phlex 2.3+

### Setup

1. Clone or add this component library to your Rails project

2. Add required gems to your Gemfile:
```ruby
gem "phlex-rails", "~> 2.3"
gem "tailwindcss-rails", "~> 4.0.0"
```

3. Install gems:
```bash
bundle install
```

4. Set up Tailwind CSS if not already configured:
```bash
bundle exec rails tailwindcss:install
```

5. Update your CSS file (`app/assets/stylesheets/application.css`):
```css
@import "tailwindcss";
```

## Component Categories

### Form Components
- **Input** - Text input field with labels, errors, and helpers
- **Textarea** - Multi-line text input
- **Select** - Dropdown selection
- **Checkbox** - Single checkbox with label
- **Radio** - Radio button with label
- **Toggle** - Switch/toggle control

### UI Components
- **Button** - Customizable button with variants and sizes
- **Badge** - Inline label/badge component
- **Alert** - Alert/notification component
- **Spinner** - Loading indicator
- **Divider** - Visual separator

### Layout Components
- **Card** - Container with optional header
- **Container** - Responsive container
- **Hero** - Hero section with title and subtitle
- **Modal** - Modal dialog
- **Navbar** - Navigation bar

### Navigation Components
- **Breadcrumb** - Breadcrumb navigation
- **Tabs** - Tabbed interface
- **Pagination** - Page navigation
- **Dropdown** - Dropdown menu

### Data Display Components
- **Table** - Data table with headers and rows
- **List** - Ordered/unordered list
- **Accordion** - Expandable accordion
- **Tooltip** - Tooltip popover

### Feature Components
- **FeatureCard** - Feature highlight card
- **TestimonialCard** - Testimonial/quote card
- **StatsSection** - Statistics display
- **CtaSection** - Call-to-action section
- **PricingTable** - Pricing plans table
- **Footer** - Footer section

## Usage

### Basic Example

```ruby
# In your Phlex view or controller
render Components::WindUI::Button.new(
  text: "Click me",
  variant: :primary,
  size: :md
)
```

### Form Component Example

```ruby
render Components::WindUI::Input.new(
  label_text: "Email Address",
  placeholder_text: "you@example.com",
  type: "email",
  required: true
)

render Components::WindUI::Textarea.new(
  label_text: "Message",
  placeholder_text: "Enter your message...",
  rows: 4
)

render Components::WindUI::Select.new(
  label_text: "Choose an option",
  options: [["Option 1", "1"], ["Option 2", "2"]],
  placeholder_text: "Select..."
)
```

### Component States

Components support various states through parameters:

```ruby
# Disabled state
Components::WindUI::Input.new(disabled: true)

# Error state
Components::WindUI::Input.new(error: "This field is required")

# With helper text
Components::WindUI::Input.new(helper_text: "Must be a valid email")

# Checked/selected
Components::WindUI::Checkbox.new(checked: true)
Components::WindUI::Toggle.new(checked: true)
```

## Component Naming Conventions

All form components use the following naming conventions to avoid conflicts with Phlex HTML element methods:

- **label_text**: Use instead of `label` parameter for input labels
- **placeholder_text**: Use instead of `placeholder` parameter for input placeholders

This prevents method shadowing with Phlex's HTML element methods.

## Customization

### Custom Classes

Add custom Tailwind classes to any component:

```ruby
Components::WindUI::Button.new(
  text: "Custom",
  class_name: "rounded-none shadow-lg"
)
```

### Variants

Components support multiple variants:

```ruby
# Button variants
%i[primary secondary danger success warning info outline ghost].each do |variant|
  render Components::WindUI::Button.new(text: variant.to_s, variant: variant)
end

# Badge variants
%i[primary secondary danger success warning info].each do |variant|
  render Components::WindUI::Badge.new(text: variant.to_s, variant: variant)
end
```

### Sizes

Most components support multiple size options:

```ruby
# Input sizes
Components::WindUI::Input.new(size: :sm)  # small
Components::WindUI::Input.new(size: :md)  # medium (default)
Components::WindUI::Input.new(size: :lg)  # large

# Button sizes
Components::WindUI::Button.new(size: :sm)
Components::WindUI::Button.new(size: :md)
Components::WindUI::Button.new(size: :lg)

# Toggle sizes
Components::WindUI::Toggle.new(size: :sm)
Components::WindUI::Toggle.new(size: :md)
Components::WindUI::Toggle.new(size: :lg)
```

## Showcase

View all components in action:

```bash
bin/dev
# Visit http://localhost:3000/components
```

The showcase displays all components with their various states and configurations.

## Testing

Components include comprehensive Minitest tests:

```bash
# Run all tests
bundle exec rails test

# Run component tests only
bundle exec rails test test/components/wind_ui/

# Run specific component test
bundle exec rails test test/components/wind_ui/button_test.rb
```

### Test Coverage

Tests cover:
- Component rendering
- Parameter handling
- Variant rendering
- Size options
- Disabled/error states
- Custom classes
- Accessibility attributes

## Architecture

### Directory Structure

```
app/
├── components/
│   ├── wind_ui_base.rb           # Base component class
│   └── wind_ui/
│       ├── input.rb
│       ├── button.rb
│       ├── card.rb
│       └── ... (30+ components)
├── controllers/
│   └── components_showcase_controller.rb
└── views/
    └── components_showcase.rb

config/
└── initializers/
    └── phlex.rb                   # Phlex configuration

test/
└── components/
    └── wind_ui/
        ├── button_test.rb
        ├── input_test.rb
        └── ... (component tests)
```

### Base Component

All components inherit from `Components::WindUI::Base`:

```ruby
class Components::WindUI::Base < Phlex::HTML
  # Shared styling helpers and constants

  def view_template
    # Component markup
  end
end
```

## Extensibility

The `WindUI` namespace allows for multiple component libraries:

```ruby
# Future: MaterialUI components
Components::MaterialUI::Button.new(text: "Click")

# Future: Bootstrap components
Components::Bootstrap::Button.new(text: "Click")
```

## Best Practices

1. **Always use `label_text` and `placeholder_text`** parameters to avoid shadowing Phlex HTML methods

2. **Use semantic HTML** - Components use proper semantic elements (button, input, select, etc.)

3. **Leverage Tailwind classes** - Customize components with Tailwind's utility classes

4. **Test your components** - Include component tests in your application

5. **Keep components focused** - Each component handles a single responsibility

## Accessibility

Components follow accessibility best practices:

- Semantic HTML structure
- ARIA attributes for interactive elements
- Keyboard navigation support
- Focus management
- Color contrast compliance
- Label associations

## Contributing

To add new components:

1. Create component file in `app/components/wind_ui/`
2. Inherit from `Components::WindUI::Base`
3. Implement `view_template` method
4. Add comprehensive tests in `test/components/wind_ui/`
5. Update the showcase view
6. Document in this README

## Styling

All components use Tailwind CSS 4.x. Customize the global style:

1. Update `app/assets/stylesheets/application.css` for CSS imports
2. Modify `config/tailwind.config.js` for Tailwind configuration (if needed)
3. Use custom Tailwind plugins in `app/assets/stylesheets/` files

## Performance

- **Server-side rendering** with Phlex for optimal performance
- **No JavaScript** required for basic functionality
- **CSS-only animations** for smooth transitions
- **Minimal dependencies** - only Phlex and Tailwind

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## License

MIT License - Feel free to use in your projects

## Credits

Built with:
- [Phlex](https://www.phlex.fun/) - Ruby view components
- [Tailwind CSS](https://tailwindcss.com/) - Utility-first CSS framework
- [Ruby on Rails](https://rubyonrails.org/) - Web framework

## Support

For issues, questions, or suggestions:
- Check the showcase at `/components`
- Review test cases for usage examples
- Check component comments for API documentation

---

**Happy building! 🚀**
# ui_components
