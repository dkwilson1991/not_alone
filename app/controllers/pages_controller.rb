class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @camps = policy_scope(Camp)
    @future_camps = Camp.where('start_date > ?', Date.today).order(:start_date).first(3)
    @past_camps = Camp.where('start_date <= ?', Date.today).order(:start_date)
  end
end
