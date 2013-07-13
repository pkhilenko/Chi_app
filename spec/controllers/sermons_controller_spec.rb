require 'spec_helper'

describe SermonsController do
	render_views

	 before(:each) do
    @admin = FactoryGirl.create( :admin )
    @user  = FactoryGirl.create( :user )
  end

  describe "GET 'index'" do
    shared_examples "sermons-render-success" do
      it "should access" do
        get :index, :locale => :en
        response.should be_success
      end
    end

    describe "for non-signed users" do
      include_examples "sermons-render-success"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      include_examples "sermons-render-success"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      include_examples "sermons-render-success"
    end
  end
end
