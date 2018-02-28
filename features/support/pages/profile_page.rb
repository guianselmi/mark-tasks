require_relative 'sections'

class ProfilePage < SitePrism::Page
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
end