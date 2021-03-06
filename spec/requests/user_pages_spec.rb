require 'spec_helper'

describe "User Pages" do

  subject{page}
  let(:base_title) {"Ruby on Rails Tutorial Sample App"}

  describe "profile page" do

    let(:user) {FactoryGirl.create(:user) } #This mcode makes a user variable
    #The create method is found in spec/factories.rb. It creates a ":user"
    #with name, email, password, and password_confirmation attributes
    before {visit user_path(user)}

    it { should have_content(user.name)}
    it { should have_title(user.name)}

  end

  describe "signup page" do

    before {visit signup_path}
    
    it { should have_content('Sign Up')}
    it { should have_title("#{base_title} | Sign Up")}
    
  end
 
  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

end
