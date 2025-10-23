# frozen_string_literal: true

class ComponentsInteractiveShowcaseController < ApplicationController
  def index
    render Views::ComponentsInteractiveShowcase.new
  end
end
