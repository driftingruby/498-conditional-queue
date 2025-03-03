class WelcomeController < ApplicationController
  def index
    if params[:jobs]
      params[:jobs].to_i.times { ExpensiveBackgroundJob.perform_later(rand) }
    end
  end
end
