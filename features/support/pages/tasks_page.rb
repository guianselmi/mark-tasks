require_relative 'sections'

class Add < SitePrism::Section
  element :input_title, 'input[name=title]'
  element :input_date, 'input[name=dueDate]'
  element :input_tags, '.bootstrap-tagsinput input'
  element :save, '#form-submit-button'

  element :alert, '.alert-warn'

  def new_task(task, tags)
    input_title.set task['title']
    input_date.set task['date']

    tags.each do |tag|
      input_tags.set tag['tag']
      input_tags.send_keys :tab
      sleep 0.5 # "Time representing the user thinking"
    end

    save.click
  end
end

class TasksPage < SitePrism::Page
  section :navbar, Navbar, '#navbar'
  section :add, Add, '#add-task-view'

  element :title, '.header-title h3'
  element :button_new, '#insert-button'
  element :search_field, 'input[name=search]'
  element :search_button, '#search-button'

  element :table_body, '.table tbody'
  elements :items, 'table tbody tr'

  def search(title)
    search_field.set title
    search_button.click
  end

  def remove_by_title(title)
    items.each do |item|
      puts item
      # item.find('#delete-button').click if item.text.include?(title)
    end
  end
end