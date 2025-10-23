# Stimulus Controllers - Usage Examples

Real-world usage examples for Wind UI Stimulus controllers.

## Table of Contents
- [Dropdown Examples](#dropdown-examples)
- [Modal Examples](#modal-examples)
- [Tabs Examples](#tabs-examples)
- [Accordion Examples](#accordion-examples)
- [Toggle Examples](#toggle-examples)
- [Tooltip Examples](#tooltip-examples)
- [Advanced Patterns](#advanced-patterns)

---

## Dropdown Examples

### Basic Dropdown
```ruby
render Components::WindUI::Dropdown.new(
  trigger: "More Actions",
  items: [
    { label: "View", href: post_path(@post) },
    { label: "Edit", href: edit_post_path(@post) },
    { label: "Delete", href: post_path(@post), danger: true }
  ]
)
```

### User Menu
```ruby
render Components::WindUI::Dropdown.new(
  trigger: current_user.name,
  items: [
    { label: "Profile", href: profile_path },
    { label: "Settings", href: settings_path },
    { label: "Sign Out", href: destroy_user_session_path, danger: true }
  ]
)
```

### Filter Dropdown
```ruby
render Components::WindUI::Dropdown.new(
  trigger: "Filter by Status",
  items: [
    { label: "All", href: posts_path },
    { label: "Published", href: posts_path(status: :published) },
    { label: "Draft", href: posts_path(status: :draft) },
    { label: "Archived", href: posts_path(status: :archived) }
  ]
)
```

---

## Modal Examples

### Confirmation Modal
```ruby
# In your view
render Components::WindUI::Modal.new(title: "Delete Post", size: :md) do
  div(class: "space-y-4") do
    p(class: "text-gray-700") { "Are you sure you want to delete this post?" }
    p(class: "text-sm text-gray-500") { "This action cannot be undone." }
    
    div(class: "flex justify-end gap-3 mt-6") do
      button(
        class: "px-4 py-2 border border-gray-300 rounded-lg",
        data: { action: "click->modal#close" }
      ) { "Cancel" }
      
      button(
        class: "px-4 py-2 bg-red-600 text-white rounded-lg",
        data: { action: "click->modal#close" }
      ) { "Delete" }
    end
  end
end

# Trigger button
button(
  class: "px-4 py-2 bg-red-600 text-white rounded-lg",
  data: { action: "click->modal#open" }
) { "Delete Post" }
```

### Form Modal
```ruby
render Components::WindUI::Modal.new(title: "Create New Post", size: :lg) do
  form(action: posts_path, method: "post", class: "space-y-4") do
    render Components::WindUI::Input.new(
      label_text: "Title",
      name: "post[title]",
      required: true
    )
    
    render Components::WindUI::Textarea.new(
      label_text: "Content",
      name: "post[content]",
      rows: 6
    )
    
    div(class: "flex justify-end gap-3 mt-6") do
      button(
        type: "button",
        class: "px-4 py-2 border border-gray-300 rounded-lg",
        data: { action: "click->modal#close" }
      ) { "Cancel" }
      
      button(
        type: "submit",
        class: "px-4 py-2 bg-blue-600 text-white rounded-lg"
      ) { "Create Post" }
    end
  end
end
```

### Image Preview Modal
```ruby
render Components::WindUI::Modal.new(title: nil, size: :xl) do
  div(class: "relative") do
    img(src: @image.url, class: "w-full h-auto rounded-lg")
    
    button(
      class: "absolute top-4 right-4 p-2 bg-black bg-opacity-50 text-white rounded-full",
      data: { action: "click->modal#close" }
    ) { "×" }
  end
end
```

---

## Tabs Examples

### Content Tabs
```ruby
render Components::WindUI::Tabs.new(
  tabs: [
    { label: "Overview", content: render_overview },
    { label: "Specifications", content: render_specs },
    { label: "Reviews", content: render_reviews }
  ],
  default_tab: 0
)
```

### Settings Tabs
```ruby
render Components::WindUI::Tabs.new(
  tabs: [
    { label: "Profile", content: render_profile_form },
    { label: "Security", content: render_security_settings },
    { label: "Notifications", content: render_notification_preferences },
    { label: "Billing", content: render_billing_info }
  ]
)
```

### Dashboard Tabs with Dynamic Content
```ruby
render Components::WindUI::Tabs.new(
  tabs: [
    { label: "Analytics", content: render_analytics_dashboard },
    { label: "Users", content: render_users_table },
    { label: "Reports", content: render_reports_section }
  ]
)
```

---

## Accordion Examples

### FAQ Accordion
```ruby
render Components::WindUI::Accordion.new(
  items: [
    {
      title: "How do I get started?",
      content: "Simply sign up for an account and follow the onboarding wizard."
    },
    {
      title: "What payment methods do you accept?",
      content: "We accept all major credit cards, PayPal, and bank transfers."
    },
    {
      title: "Can I cancel my subscription?",
      content: "Yes, you can cancel anytime from your account settings."
    }
  ]
)
```

### Feature Details Accordion
```ruby
render Components::WindUI::Accordion.new(
  items: [
    {
      title: "🚀 Fast Performance",
      content: "Our platform is optimized for speed with CDN delivery and caching."
    },
    {
      title: "🔒 Enterprise Security",
      content: "Bank-level encryption, SOC 2 compliance, and regular security audits."
    },
    {
      title: "📊 Advanced Analytics",
      content: "Real-time dashboards, custom reports, and data exports."
    }
  ]
)
```

---

## Toggle Examples

### Simple Toggle
```ruby
render Components::WindUI::Toggle.new(
  label_text: "Enable email notifications",
  checked: current_user.email_notifications,
  name: "user[email_notifications]"
)
```

### Size Variants
```ruby
# Small toggle
render Components::WindUI::Toggle.new(
  label_text: "Small",
  size: :sm,
  checked: true
)

# Medium toggle (default)
render Components::WindUI::Toggle.new(
  label_text: "Medium",
  size: :md,
  checked: true
)

# Large toggle
render Components::WindUI::Toggle.new(
  label_text: "Large",
  size: :lg,
  checked: true
)
```

### Settings Page Toggle Group
```ruby
div(class: "space-y-4") do
  render Components::WindUI::Toggle.new(
    label_text: "Email notifications",
    checked: @settings.email_notifications
  )
  
  render Components::WindUI::Toggle.new(
    label_text: "Push notifications",
    checked: @settings.push_notifications
  )
  
  render Components::WindUI::Toggle.new(
    label_text: "SMS notifications",
    checked: @settings.sms_notifications
  )
end
```

---

## Tooltip Examples

### Help Text Tooltips
```ruby
render Components::WindUI::Tooltip.new(
  text: "Your password must be at least 8 characters",
  position: :right
) do
  span(class: "text-gray-400 cursor-help") { "ⓘ" }
end
```

### Icon Buttons with Tooltips
```ruby
div(class: "flex gap-2") do
  render Components::WindUI::Tooltip.new(text: "Edit", position: :top) do
    button(class: "p-2 hover:bg-gray-100 rounded") { "✏️" }
  end
  
  render Components::WindUI::Tooltip.new(text: "Delete", position: :top) do
    button(class: "p-2 hover:bg-gray-100 rounded") { "🗑️" }
  end
  
  render Components::WindUI::Tooltip.new(text: "Share", position: :top) do
    button(class: "p-2 hover:bg-gray-100 rounded") { "📤" }
  end
end
```

### Status Indicator with Tooltip
```ruby
render Components::WindUI::Tooltip.new(
  text: "System is operational - Last checked 2 minutes ago",
  position: :bottom
) do
  div(class: "flex items-center gap-2") do
    span(class: "w-3 h-3 bg-green-500 rounded-full")
    span(class: "text-sm text-gray-600") { "Operational" }
  end
end
```

---

## Advanced Patterns

### Nested Modals
```ruby
# Outer modal
render Components::WindUI::Modal.new(title: "Select Template", size: :lg) do
  div(class: "grid grid-cols-2 gap-4") do
    @templates.each do |template|
      button(
        class: "p-4 border rounded-lg hover:border-blue-500",
        data: { action: "click->inner-modal#open" }
      ) do
        plain(template.name)
      end
    end
  end
  
  # Inner modal for preview
  render Components::WindUI::Modal.new(title: "Template Preview", size: :md) do
    # Preview content
  end
end
```

### Toggle with Custom Event Handler
```html
<div data-controller="custom">
  <%= render Components::WindUI::Toggle.new(
    label_text: "Dark Mode",
    checked: false,
    data: { action: "toggle:change->custom#handleToggle" }
  ) %>
</div>

<script>
// In custom_controller.js
handleToggle(event) {
  const isChecked = event.detail.checked
  document.body.classList.toggle('dark-mode', isChecked)
}
</script>
```

### Accordion with Multiple Open Sections
```ruby
# Modify the component data attribute
div(
  data: {
    controller: "accordion",
    accordion_allow_multiple_value: "true"
  }
) do
  # Accordion items...
end
```

### Programmatic Modal Control
```javascript
// Open modal from custom JavaScript
const modalElement = document.querySelector('[data-controller="modal"]')
const modalController = application.getControllerForElementAndIdentifier(
  modalElement,
  'modal'
)

modalController.open()

// Or with a custom event
document.dispatchEvent(new CustomEvent('modal:open'))
```

### Dropdown with Dynamic Content
```ruby
render Components::WindUI::Dropdown.new(
  trigger: "#{@cart.items.count} items",
  items: @cart.items.map do |item|
    {
      label: "#{item.name} - $#{item.price}",
      href: item_path(item)
    }
  end + [
    { label: "View Cart", href: cart_path },
    { label: "Checkout", href: checkout_path }
  ]
)
```

### Tabs with URL Fragment Support
```javascript
// In a custom tabs_controller.js extension
connect() {
  super.connect()
  
  // Check URL fragment and open corresponding tab
  const hash = window.location.hash.substring(1)
  const tabIndex = this.tabTargets.findIndex(
    tab => tab.dataset.tabName === hash
  )
  
  if (tabIndex >= 0) {
    this.showTab(tabIndex)
  }
}

select(event) {
  super.select(event)
  
  // Update URL without page reload
  const tabName = event.currentTarget.dataset.tabName
  if (tabName) {
    history.replaceState(null, '', `#${tabName}`)
  }
}
```

---

## Tips & Tricks

### 1. Combining Components
```ruby
# Dropdown with tooltips on items
render Components::WindUI::Dropdown.new(
  trigger: "Actions",
  items: [
    { label: "Edit", href: "#" },
    { label: "Delete (with confirmation)", href: "#", danger: true }
  ]
)
```

### 2. Accessibility First
All components include proper ARIA attributes:
- `aria-expanded` for expandable content
- `aria-selected` for tabs
- `aria-checked` for toggles
- `role` attributes for semantic meaning

### 3. Keyboard Navigation
Test your components with keyboard only:
- Tab through all interactive elements
- Use arrow keys in tabs
- Press Escape to close dropdowns/modals

### 4. Mobile Considerations
- Dropdowns automatically adjust positioning
- Modals are responsive with max-height
- Touch events are properly handled

### 5. Performance
- Controllers clean up event listeners on disconnect
- CSS transitions instead of JavaScript animations
- Minimal DOM manipulation

---

## Testing Checklist

For each component, verify:

- [ ] Visual appearance matches design
- [ ] Click/tap interactions work
- [ ] Keyboard navigation functions
- [ ] Escape key closes (where applicable)
- [ ] ARIA attributes are present
- [ ] Mobile responsive
- [ ] Works in all target browsers
- [ ] No console errors
- [ ] Proper focus management

---

Need more examples? Check out the showcase page at `/components_showcase`!
