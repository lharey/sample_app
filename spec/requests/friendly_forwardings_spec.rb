require 'spec_helper'

describe "FriendlyForwarding" do

  it "should forward to the user requested page after signin" do
    user = Factory(:user)
    visit edit_user_path(user)
    #the test automatically follows the redirect to the signin page
    fill_in :email, :with => user.email
    fill_in :password, :with => user.password
    click_button
    #the test follows redirect again, this time to users/edit
    response.should render_template('users/edit')
  end
end
