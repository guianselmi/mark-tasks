require_relative 'sections'

class Add < SitePrism::Section
  element :task_title, 'input[name=title]'
  element :due_date, 'input[name=dueDate]'
  element :save, '#form-submit-button'
end

class TasksPage < SitePrism::Page
  section :navbar, Navbar, '#navbar'
  section :form, Add, '#add-task-view'

  element :title, '.header-title h3'
  element :new_task, '#insert-button'
end