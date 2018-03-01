require_relative 'sections'

class Add < SitePrism::Section
  element :input_title, 'input[name=title]'
  element :input_date, 'input[name=dueDate]'
  element :input_tags, '.bootstrap-tagsinput input'
  element :save, '#form-submit-button'

  def new_task(task, tags)
    input_title.set task['title']
    input_date.set task['date']

    tags.each do |tag|
      input_tags.set tag['tag']
      input_tags.send_keys :tab
    end

    save.click
  end
end

class TasksPage < SitePrism::Page
  section :navbar, Navbar, '#navbar'
  section :add, Add, '#add-task-view'

  element :title, '.header-title h3'
  element :new_task, '#insert-button'
end