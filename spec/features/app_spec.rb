require 'rails_helper'

describe 'App', js: true do
  it 'loads the page' do
    100.times { visit '/'}
  end
end
