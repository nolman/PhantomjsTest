class WelcomesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def slow
    sleep(1)
    render :content_type => 'text/javascript'
  end
end
