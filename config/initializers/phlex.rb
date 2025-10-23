# frozen_string_literal: true

module Views
end

module Components
  extend Phlex::Kit
end

module Components::WindUI
end

Rails.autoloaders.main.push_dir(
  Rails.root.join("app/views"), namespace: Views
)

Rails.autoloaders.main.push_dir(
  Rails.root.join("app/components"), namespace: Components
)

Rails.autoloaders.main.push_dir(
  Rails.root.join("app/components/wind_ui"), namespace: Components::WindUI
)
