# frozen_string_literal: true

# Testimonial Card component - displays customer testimonials
#
# Usage:
#   Components::WindUI::TestimonialCard.new(
#     quote: "This is amazing!",
#     author: "John Doe",
#     role: "CEO"
#   )
class Components::WindUI::TestimonialCard < Components::WindUI::Base
  attr_reader :quote, :author, :role, :image_url, :rating, :class_name

  def initialize(
    quote: nil,
    author: nil,
    role: nil,
    image_url: nil,
    rating: 5,
    class_name: nil,
    **attrs
  )
    @quote = quote
    @author = author
    @role = role
    @image_url = image_url
    @rating = rating
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    component_class = [
      "p-6 bg-white border border-gray-200 rounded-lg",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    div(class: component_class, **@attrs) do
      # Quote
      if quote.present?
        p(class: "text-gray-700 italic mb-4") { "\"#{quote}\"" }
      end

      # Author info
      div(class: "flex items-center") do
        if image_url.present?
          img(src: image_url, alt: author, class: "w-12 h-12 rounded-full mr-4")
        end

        div do
          h4(class: "font-semibold text-gray-900") { plain(author) } if author.present?
          p(class: "text-sm text-gray-600") { plain(role) } if role.present?
        end
      end

      # Rating
      if rating.present?
        div(class: "mt-4 flex items-center") do
          rating.times do
            span(class: "text-yellow-400") { "★" }
          end
        end
      end
    end
  end
end
