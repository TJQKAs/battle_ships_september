require 'spec_helper'

feature 'Starting new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    expect(page).to have_content "What's your name?"
  end
  end

feature 'We should check that Player input his name' do
scenario "What's your name?"  do
redirect '/no_name' if @player1 == ""
expect(page).to have_content "You did not input your name,"
end
end
