class Dashboard::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  layout 'dashboard/dashboard'
end
