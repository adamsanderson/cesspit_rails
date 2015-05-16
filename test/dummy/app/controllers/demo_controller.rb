class DemoController < ApplicationController
  def show
    @css_classes = params[:id]
  end
end