# Stimulus Controllers Documentation

This document explains the Stimulus controllers implemented for Wind UI components. All controllers are well-organized, clean, easy to understand, and fully functional.

## Overview

The following interactive components are powered by Stimulus:
- **Dropdown** - Toggle dropdown menus
- **Modal** - Show/hide modal dialogs
- **Tabs** - Switch between tab panels
- **Accordion** - Expand/collapse accordion items
- **Toggle** - Switch state management
- **Tooltip** - Show/hide tooltips on hover

---

## Dropdown Controller

**Purpose**: Handles dropdown menu toggle behavior with click-outside-to-close functionality.

### Features
- Toggle dropdown visibility on click
- Close dropdown when clicking outside
- Keyboard support (Escape to close)
- Proper ARIA attributes for accessibility

### Targets
- `trigger` - The button that triggers the dropdown
- `menu` - The dropdown menu container

### Classes
- `hidden` - Class to hide/show the menu

### Usage Example
```ruby
Components::WindUI::Dropdown.new(
  trigger: "Options",
  items: [
    { label: "Edit", href: "/edit" },
    { label: "Delete", href: "/delete", danger: true }
  ]
)
```

### HTML Structure
The component generates:
```html
<div data-controller="dropdown">
  <button data-dropdown-target="trigger" data-action="click->dropdown#toggle">
    Options
  </button>
  <div data-dropdown-target="menu" class="hidden">
    <!-- Menu items -->
  </div>
</div>
```

---

## Modal Controller

**Purpose**: Manages modal dialogs with backdrop, body scroll locking, and focus management.

### Features
- Show/hide modal with smooth transitions
- Prevent body scroll when modal is open
- Click backdrop to close
- Keyboard support (Escape to close)
- Focus trap for accessibility

### Targets
- `container` - The modal container
- `backdrop` - The backdrop overlay

### Classes
- `hidden` - Class to hide/show the modal

### Actions
- `open()` - Opens the modal
- `close()` - Closes the modal

### Usage Example
```ruby
Components::WindUI::Modal.new(title: "Confirm Action", size: :md) do
  "Are you sure you want to proceed?"
end
```

### Opening a Modal
You can open a modal programmatically:
```javascript
// From another controller or custom code
const modal = this.application.getControllerForElementAndIdentifier(
  document.querySelector('[data-controller="modal"]'),
  'modal'
)
modal.open()
```

Or with a button:
```html
<button data-action="click->modal#open">Open Modal</button>
```

---

## Tabs Controller

**Purpose**: Handles tab switching with keyboard navigation support.

### Features
- Switch between tabs on click
- Keyboard navigation (Arrow keys, Home, End)
- Proper ARIA attributes
- Smooth transitions

### Targets
- `tab` - Tab button elements
- `panel` - Tab panel elements

### Classes
- `active` - Applied to active tab
- `inactive` - Applied to inactive tabs

### Values
- `index` - Current active tab index (default: 0)

### Usage Example
```ruby
Components::WindUI::Tabs.new(
  tabs: [
    { label: "Tab 1", content: "Content for tab 1" },
    { label: "Tab 2", content: "Content for tab 2" },
    { label: "Tab 3", content: "Content for tab 3" }
  ],
  default_tab: 0
)
```

### Keyboard Navigation
- **Arrow Left/Right**: Navigate between tabs
- **Home**: Jump to first tab
- **End**: Jump to last tab

---

## Accordion Controller

**Purpose**: Manages accordion expand/collapse behavior with smooth animations.

### Features
- Expand/collapse items on click
- Single or multiple items open (configurable)
- Smooth height animations
- Icon rotation on expand/collapse
- Proper ARIA attributes

### Targets
- `item` - Accordion item container
- `trigger` - Button that triggers expand/collapse
- `content` - Content to show/hide
- `icon` - Icon to rotate (optional)

### Values
- `allowMultiple` - Allow multiple items open simultaneously (default: false)

### Usage Example
```ruby
Components::WindUI::Accordion.new(
  items: [
    { title: "Section 1", content: "Content for section 1" },
    { title: "Section 2", content: "Content for section 2" },
    { title: "Section 3", content: "Content for section 3" }
  ]
)
```

### Allow Multiple Open
To allow multiple accordion items to be open:
```html
<div data-controller="accordion" data-accordion-allow-multiple-value="true">
  <!-- accordion items -->
</div>
```

---

## Toggle Controller

**Purpose**: Manages toggle/switch state with form integration.

### Features
- Toggle state on click
- Keyboard support (Space/Enter)
- Syncs with hidden checkbox for forms
- Custom event dispatch for external listeners
- Smooth animations

### Targets
- `button` - The toggle button
- `input` - Hidden checkbox input
- `dot` - The toggle dot element

### Classes
- `on` - Applied when checked
- `off` - Applied when unchecked

### Values
- `checked` - Current checked state (default: false)

### Usage Example
```ruby
Components::WindUI::Toggle.new(
  label_text: "Enable notifications",
  checked: true,
  size: :md
)
```

### Listening to Changes
```javascript
// Listen for toggle changes
element.addEventListener('toggle:change', (event) => {
  console.log('Toggle state:', event.detail.checked)
})
```

---

## Tooltip Controller

**Purpose**: Shows/hides tooltips on hover with configurable delay.

### Features
- Show on hover/focus
- Hide on mouse leave/blur
- Configurable delay
- Smooth fade transitions
- Prevents tooltip from capturing mouse events

### Targets
- `content` - The tooltip content element

### Classes
- `hidden` - Hidden state classes
- `visible` - Visible state classes

### Values
- `delay` - Delay before showing tooltip in milliseconds (default: 200)

### Usage Example
```ruby
Components::WindUI::Tooltip.new(text: "Help text", position: :top) do
  "Hover me"
end
```

### Available Positions
- `:top` - Above the element
- `:bottom` - Below the element
- `:left` - Left of the element
- `:right` - Right of the element

---

## Best Practices

### Accessibility
All controllers implement proper ARIA attributes:
- `aria-expanded` for dropdowns and accordions
- `aria-checked` for toggles
- `aria-selected` for tabs
- `role` attributes (menu, dialog, tooltip, etc.)

### Keyboard Navigation
Controllers support standard keyboard interactions:
- **Escape**: Close dropdowns and modals
- **Space/Enter**: Activate toggles
- **Arrow Keys**: Navigate tabs

### Performance
- Event listeners are properly cleaned up on disconnect
- Animations use CSS transitions
- Minimal DOM manipulation

### Customization
All controllers support customization through:
- CSS classes (via `data-*-class` attributes)
- Values (via `data-*-value` attributes)
- Targets (for custom markup)

---

## Development

### File Structure
```
app/javascript/controllers/
├── dropdown_controller.js
├── modal_controller.js
├── tabs_controller.js
├── accordion_controller.js
├── toggle_controller.js
└── tooltip_controller.js
```

### Testing
Test your controllers by:
1. Verifying keyboard interactions
2. Checking accessibility with screen readers
3. Testing on different browsers
4. Validating ARIA attributes

### Extending Controllers
You can extend any controller:
```javascript
import DropdownController from "./dropdown_controller"

export default class extends DropdownController {
  // Add custom functionality
}
```

---

## Troubleshooting

### Controller not connecting
1. Ensure Stimulus is properly loaded
2. Check `data-controller` attribute is present
3. Verify controller file is in `app/javascript/controllers/`

### Targets not found
1. Verify `data-*-target` attributes match the controller name
2. Check targets are defined in the controller
3. Ensure targets exist in the DOM

### Styling issues
1. Check CSS classes are properly applied
2. Verify Tailwind classes are not being purged
3. Ensure transitions are defined in CSS

---

## Additional Resources

- [Stimulus Handbook](https://stimulus.hotwired.dev/handbook/introduction)
- [Wind UI Documentation](https://wind-ui.com/)
- [ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apg/)
