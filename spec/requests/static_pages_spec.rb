require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home Page" do
    before { visit root_path }
    it { should have_selector('h1', :text => 'Fantasy World Builder') }
  end

end