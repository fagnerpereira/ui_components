# frozen_string_literal: true

# Controller for displaying all UI components
class ComponentsShowcaseController < ApplicationController
  def index
    render Views::ComponentsShowcase
  end
end
