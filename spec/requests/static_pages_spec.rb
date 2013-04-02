require 'spec_helper'

describe "Static Pages" do

  subject { page }  #tells rspec that 'page' is the subject of the tests
                    # which eliminates need to say page.should and use it { should ....}

  describe "Home page" do
    before { visit root_path } # before is an rspec thing like @before in junit.  
                                #root_path is rails path stuff

    it { should have_selector('h1', text: 'Sample App') }
    it { should have_selector('title', text: full_title('')) }  # full_title is in spec/support/utilities.rb
                                                              # files in /support are included 
                                                              # automatically by rspec 
  end

  describe "Help page" do
    before { visit help_path }   
    it { should have_selector('h1',     text: 'Help') }
    it { should have_selector('title',  text: full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it {should have_selector('h1',    text: 'About')}
    it {should have_selector('title', text: full_title('About Us'))}
  end

  describe "Contact Page" do
    before { visit contact_path }

    it { should have_selector('h1',     text: 'Contact') }
    it { should have_selector('title',  text: full_title('Contact')) }
  end
    
end


