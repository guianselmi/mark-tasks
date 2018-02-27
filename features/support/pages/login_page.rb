class LoginPage < SitePrism::Page
  set_url 'https://marktasks.herokuapp.com'
  element :input_email, 'input[placeholder="example@gmail.com"]'
  element :input_password, 'input[type=password]'
  element :login_button, 'button[id*=btnLogin]'
  element :alert, '.alert-login'

  def do_login(email, password)
    input_email.set email
    input_password.set password
    login_button.click
  end
end
