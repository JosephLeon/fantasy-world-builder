require 'spec_helper'

describe "CharacterPages" do

  subject { page }

  describe "Character Creation Page" do
    before { visit new_path }
    it { should have_selector('h1', :text => 'Character Creation') }
    it { should have_title('Character Creation') }
  end

end
