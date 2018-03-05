require_relative 'sections'

class ProfilePage < SitePrism::Page
  set_url '/user_settings/profile'

  section :navbar, Navbar, '#navbar'

  element :form, '#user-settings-profile-edit-form'
  element :input_company, 'input[name$=company]'
  element :role_combo, 'select[name$=job]'
  element :save_button, '#form-submit-button'

  def update(company, role)
    input_company.set company
    role_combo.find('option', text: role).select_option
    save_button.click
  end

  def upload(photo)
    attach_file('profile-avatar', photo)
  end
end