require 'spec_helper'

describe "Microposts" do

  before(:each) do
    user = Factory(:user)
    visit signin_path
    fill_in :email,    :with => user.email
    fill_in :password, :with => user.password
    click_button
  end

  describe "creation" do

    describe "failure" do

      it "should not make a new micropost" do
        lambda do
          visit root_path
          fill_in :micropost_content, :with => ""
          click_button
          response.should render_template('pages/home')
          response.should have_selector("div#error_explanation")
        end.should_not change(Micropost, :count)
      end
    end

    describe "success" do

      it "should make a new micropost and description should be singular" do
        content = "Lorem ipsum dolor sit amet"
        lambda do
          visit root_path
          fill_in :micropost_content, :with => content
          click_button
          response.should have_selector("span.content", :content => content)
          response.should have_selector("td", :class => "sidebar round")
          response.should have_selector("span", :class => "microposts", :content => "1 micropost")
        end.should change(Micropost, :count).by(1)
      end
            
      it "should have proper pluralization" do
        content1 = "first post"
        content2 = "second post"
        lambda do
          visit root_path
          fill_in :micropost_content, :with => content1
          click_button
          fill_in :micropost_content, :with => content2
          click_button
          response.should have_selector("span.content", :content => content1)
          response.should have_selector("span.content", :content => content2)
          response.should have_selector("td", :class => "sidebar round")          
          response.should have_selector("span", :class => "microposts", :content => "2 microposts")
          response.should have_selector("div.flash.success", :content => "Micropost created!")
        end.should change(Micropost, :count).by(2)
      end      
    end
  end

end
