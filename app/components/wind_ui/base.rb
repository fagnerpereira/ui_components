# frozen_string_literal: true

# Base class for all WindUI components
# Provides common functionality and styling helpers
class Components::WindUI::Base < Components::Base
  # Common variant mappings for color schemes
  VARIANT_COLORS = {
    primary: "bg-blue-600 hover:bg-blue-700 text-white",
    secondary: "bg-gray-200 hover:bg-gray-300 text-gray-900",
    danger: "bg-red-600 hover:bg-red-700 text-white",
    success: "bg-green-600 hover:bg-green-700 text-white",
    warning: "bg-amber-600 hover:bg-amber-700 text-white",
    info: "bg-cyan-600 hover:bg-cyan-700 text-white",
    outline: "border-2 border-gray-300 hover:bg-gray-50 text-gray-900",
    ghost: "hover:bg-gray-100 text-gray-900"
  }.freeze

  SIZE_CLASSES = {
    xs: "px-2 py-1 text-xs",
    sm: "px-3 py-2 text-sm",
    md: "px-4 py-2 text-base",
    lg: "px-6 py-3 text-lg",
    xl: "px-8 py-4 text-xl"
  }.freeze

  # Helper to get color classes for a variant
  def self.variant_class(variant = :primary)
    VARIANT_COLORS[variant.to_sym] || VARIANT_COLORS[:primary]
  end

  # Helper to get size classes
  def self.size_class(size = :md)
    SIZE_CLASSES[size.to_sym] || SIZE_CLASSES[:md]
  end

  protected

  def variant_class(variant = :primary)
    self.class.variant_class(variant)
  end

  def size_class(size = :md)
    self.class.size_class(size)
  end
end
