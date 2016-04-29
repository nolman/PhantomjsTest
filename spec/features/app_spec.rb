require 'rails_helper'

describe 'App', js: true do
  it 'loads the page' do
    100.times {
      visit '/'
      wait_for_ajax
    }
  end


  def wait_for_ajax
    active_requests = nil
    timeout_at = Time.now + Capybara.default_max_wait_time.seconds
    loop do
      active_requests = page.driver.network_traffic.select { |t| t.response_parts.empty? }
      break if active_requests.empty? || Time.now > timeout_at
      sleep 0.1
    end
    if active_requests.any?
      requests = active_requests.map(&:inspect).join("\n\n")
      raise "#{requests} timed out after #{Capybara.default_max_wait_time} seconds"
    end
  end
end
