require 'rails_helper'
require 'spec_helper'

RSpec.describe LevelsController, :type => :controller do 
  describe "use as anonymous user" do
    before :each do
      # This simulates an anonymous user
      login_with nil
    end

    it "should be redirected to signin" do
      get :index
      expect(response).to redirect_to( new_user_session_path )
    end
  end 
  
  describe "GET #index" do 
    it "populates an array of levels" do
      level = FactoryGirl.create(:level)
      get :index
      #expect(assigns(:level)).to eq([level])
    end
    
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end 

  describe "GET #show" do 
    it "assigns the requested level to @level" 
    it "renders the :show template" 
  end 

  describe "GET #new" do 
      it "assigns a new level to @level" 
      it "renders the :new template" 
  end 

  describe "POST #create" do 
    context "with valid attributes" do 
      it "saves the new level in the database" 
      it "redirects to the home page" 
    end 

    context "with invalid attributes" do 
      it "does not save the new level in the database" 
      it "re-renders the :new template" 
    end 
  end
end