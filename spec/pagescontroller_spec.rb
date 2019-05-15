describe PagesController, :type => :controller do
    it "should render the Welcome view" do
      allow(controller).to receive(:current_user).and_return(nil)
      get 'home'
      expect(controller).to render_template(:home)
    end
  end