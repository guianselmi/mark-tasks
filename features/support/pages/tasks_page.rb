require_relative 'sections'

class Add < SitePrism::Section
  element :input_title, 'input[name=title]'
  element :input_date, 'input[name=dueDate]'
  element :save, '#form-submit-button'

  def new_task(title, date)
    input_title.set title
    input_date.set date
    save.click
  end
end

class TasksPage < SitePrism::Page
  section :navbar, Navbar, '#navbar'
  section :add, Add, '#add-task-view'

  element :title, '.header-title h3'
  element :new_task, '#insert-button'
end