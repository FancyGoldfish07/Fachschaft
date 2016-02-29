module AcceptanceTestHelper

  def sign_in(user)
    visit root_path

    find(:xpath, "//a[@href='/users/sign_in']").click
    # alternative way to sign up does not work
    # click_link 'Einloggen'

    within '#new_user' do
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => '12345678'
    end

    click_on 'Einloggen'
    visit root_path
  end

  def sign_out(user)
    find(:xpath, "//a[@href='/users/sign_out']").click
  end
end