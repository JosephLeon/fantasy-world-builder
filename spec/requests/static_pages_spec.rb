require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home Page" do
    before { visit root_path }
    it { should have_selector('h1', :text => 'Fantasy World Builder') }
    it { should have_title('Fantasy World Builder') }
  end

  describe "Help Page" do
    before { visit help_path }
    it { should have_selector('h1', :text => 'Help Page') }
    it { should have_title('Help Page') }
  end

end
