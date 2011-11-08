# given_when_then

Use selected Cucumber-like syntax in your Rspec tests.


## Installation

In your Gemfile:

    group :test do
      gem 'given_when_then'
      # ...
    end


## Example Usage

If you'd love to use the Cucumber Given-When-Then mantra in your Rspec tests, just use it in place of the describe/it method calls like in this integration test:

    describe 'Signing up' do
      Given 'there is a guest user' do
        let(:user) { stub('user', :name => 'Mr XY', :email => 'xy@example.com', :password => 'secret' ) }

        When 'he goes to the home page' do
          before { visit root_path }

          Then 'he should see the navigational links' do
            page.should have_content 'Sign up or Log in'
          end

          When 'he clicks the Sign up link' do
            before { visit signup_path }

            Then 'he should be presented with a signup form' do
              page.should have_selector 'div[id="signup_form"]'
            end

            When 'he clicks the Sign up button without filling in his credentials' do
              Then 'he should see an error message' do
                click_button 'Sign up'
                page.should have_content('errors prohibited')
                User.count.should == 0
              end

              And 'the path to the form should be the signup_path (see routes.rb)' do
                current_path.should == signup_path
              end
            end

            When 'he fills the form with his credentials and clicks the Sign up button' do
              before do
                fill_in 'Name', :with => user.name
                fill_in 'Email', :with => user.email
                fill_in 'Password', :with => user.password
                fill_in 'Confirm Password', :with => user.password
                click_button 'Sign up'
              end

              Then 'he should be signed up successfully' do
                page.should have_content('Signed up!')
                current_path.should == root_path
                User.count.should == 1
              end
            end
          end
        end
      end
    end


When you run the test with -fs, then in case of success you get a nicely formatted output:

    Signing up
      Given there is a guest user
        When he visits the home page
          Then he should see the navigational links
          When he clicks the Sign up link
            Then he should be presented with a signup form
            When he clicks the Sign up button without filling in his credentials
              Then he should see an error message
              And the path to the form should be the signup_path (see routes.rb)
            When he fills the form with his credentials and clicks the Sign up button
              Then he should be signed up successfully


Given and When are wrappers around Rspec's 'describe', while Then, And and Or wrap Rspec's 'it'.
There's no Scenario or Feature because this is Rspec, not Cucumber.

