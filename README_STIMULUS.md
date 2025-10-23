# Stimulus Controllers - Quick Start Guide

This project includes fully functional Stimulus controllers for all interactive Wind UI components.

## 🎯 What's Included

### Controllers Created
- ✅ **dropdown_controller.js** - Toggle dropdowns with click-outside-to-close
- ✅ **modal_controller.js** - Modal dialogs with backdrop and body scroll lock
- ✅ **tabs_controller.js** - Tab switching with keyboard navigation
- ✅ **accordion_controller.js** - Expand/collapse with smooth animations
- ✅ **toggle_controller.js** - Switch/toggle with form integration
- ✅ **tooltip_controller.js** - Hover tooltips with configurable delay

### Features
- 🎨 Clean, organized, and well-commented code
- ♿ Full accessibility support (ARIA attributes, keyboard navigation)
- 🎭 Smooth CSS transitions
- 📱 Mobile-friendly
- 🔌 Easy to extend and customize

## 🚀 Quick Examples

### Dropdown
```ruby
Components::WindUI::Dropdown.new(
  trigger: "Options",
  items: [
    { label: "Edit", href: "/edit" },
    { label: "Delete", href: "/delete", danger: true }
  ]
)
```

### Modal
```ruby
# In your view
render Components::WindUI::Modal.new(title: "Confirm", size: :md) do
  "Are you sure?"
end

# Trigger button
button(data: { action: "click->modal#open" }) { "Open Modal" }
```

### Tabs
```ruby
Components::WindUI::Tabs.new(
  tabs: [
    { label: "Tab 1", content: "Content 1" },
    { label: "Tab 2", content: "Content 2" }
  ],
  default_tab: 0
)
```

### Accordion
```ruby
Components::WindUI::Accordion.new(
  items: [
    { title: "Section 1", content: "Content 1" },
    { title: "Section 2", content: "Content 2" }
  ]
)
```

### Toggle
```ruby
Components::WindUI::Toggle.new(
  label_text: "Enable notifications",
  checked: true,
  size: :md
)
```

### Tooltip
```ruby
Components::WindUI::Tooltip.new(text: "Help text", position: :top) do
  button { "Hover me" }
end
```

## 📋 Integration Checklist

All components are **fully integrated** and ready to use:

- [x] Stimulus controllers created in `app/javascript/controllers/`
- [x] Ruby components updated with `data-controller` attributes
- [x] ARIA attributes for accessibility
- [x] Keyboard navigation support
- [x] CSS transitions included
- [x] Showcase page updated with interactive examples

## 🎓 Documentation

Full documentation available in `/docs/STIMULUS_CONTROLLERS.md` including:
- Detailed API reference
- Customization options
- Accessibility guidelines
- Troubleshooting tips

## 🧪 Testing

Visit `/components_showcase` to see all components in action with:
- Interactive dropdowns
- Working modals
- Functional tabs
- Smooth accordions
- Toggle switches
- Hover tooltips

## 🛠️ Customization

All controllers support customization via data attributes:

```html
<!-- Custom CSS classes -->
<div data-controller="dropdown" 
     data-dropdown-hidden-class="invisible opacity-0">
  <!-- ... -->
</div>

<!-- Custom values -->
<div data-controller="tooltip" 
     data-tooltip-delay-value="500">
  <!-- ... -->
</div>
```

## ⌨️ Keyboard Support

- **Escape**: Close dropdowns and modals
- **Space/Enter**: Activate toggles
- **Arrow Keys**: Navigate tabs (Left/Right/Home/End)
- **Tab**: Standard focus navigation

## 📦 Dependencies

- Stimulus (via Hotwired)
- Tailwind CSS
- Phlex for component rendering

## 🔧 Development

All controllers follow Stimulus best practices:
- Proper lifecycle hooks (connect/disconnect)
- Event listener cleanup
- CSS class management via Stimulus classes API
- Value API for state management

## 💡 Tips

1. **Dropdown**: Automatically closes when clicking outside
2. **Modal**: Body scroll is locked when open
3. **Tabs**: Use arrow keys for quick navigation
4. **Accordion**: Set `data-accordion-allow-multiple-value="true"` for multiple open sections
5. **Toggle**: Dispatches custom `toggle:change` event
6. **Tooltip**: Configurable delay prevents flickering

## 🎯 Next Steps

1. Run your Rails server: `bin/dev`
2. Visit `/components_showcase`
3. Test all interactive components
4. Customize as needed for your project

**Everything is ready to use! No additional setup required.** 🎉
