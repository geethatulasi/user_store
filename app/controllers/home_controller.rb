class HomeController < ApplicationController
  def index
    @stores = Store.order(created_at: :desc)
  end
end
