#/usr/bin/ruby
require 'colorize'
require 'capybara/rspec'

session = Capybara::Session.new(:selenium)
describe "Opening Assembla: ", js: true, type: :feature do
  it "going to the Assembla page..." do
    session.visit 'http://assembla.com/home'
    expect(session).to have_content 'Assembla'
  end
  it "going to the login page" do
    session.find_link('Login').text
    session.click_link "Login"
    sleep(5)
    expect(session).to have_content "Sign in to Assembla"
  end
  it "signing in..." do
    session.fill_in 'user_login', with: 'testassembla_przemyslaw+1'
    sleep(2)
    session.fill_in 'user_password', with: 'przemyslaw+1'
    session.click_button 'Sign in'
    sleep(10)
    expect(session).to have_content "przemyslaw+1"
    puts "User Signed in - test PASS".green
    sleep(5)
  end
end

describe "Looking for user", js: true, type: :feature do
  it "use the web" do
    session.fill_in('q', :with => 'przemyslaw+1').native.send_keys(:return)
    sleep (5)
    expect(session).to have_content 'user'
    sleep (5)
  end
end
