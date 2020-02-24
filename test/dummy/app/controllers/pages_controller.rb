class PagesController < ApplicationController
  def show
    render params[:id], layout: page_layout
  rescue ActionView::MissingTemplate => e
    render :not_found, layout: 'blank'
  end

  def page_layout
    return "top_app_bar" if params[:id].match?("top_app_bar_demo_")
    return "login" if params[:id] == "login"
    "application"
  end
end
