### Register task ###
Given('I have a new task with:') do |table|
  @task_table = table.rows_hash
  @task_table['title'] = "#{@task_table['title']}: #{Faker::Lorem.characters(10)}"
end

Given('I want to tag this task with:') do |table|
  @tags = table.hashes
end

Given("I had already registered this task and hadn't realized") do
  @tasks.button_new.click
  @tasks.add.new_task(@task_table, @tags)
end

When('I register this task') do
  @tasks.button_new.click
  @tasks.add.new_task(@task_table, @tags)
end

Then('I see this task registered with status {string}') do |task_status|
  @tasks.wait_for_items
  expect(@tasks.items.first).to have_content task_status

  @tasks.search(@task_table['title'])
  expect(@tasks.items.size).to eql 1
end

Then('I should see the message {string} when trying to register') do |message|
  expect(@tasks.add.alert.text).to eql message
end


### Remove task ###
Given('I have a registered task') do
  @task_to_remove = {
    'title' => "Task to be removed: #{Faker::Lorem.characters(10)}",
    'date' => '01/06/2018'
  }
  @tags = []

  @tasks.button_new.click
  @tasks.add.new_task(@task_to_remove, @tags)
end

When('I request the removal of this task') do
  @tasks.wait_for_items
  @tasks.remove_by_title(@task_to_remove['title'])
end

When('confirm this request') do
  @tasks.modal_confirm.click
end

When('cancel this request') do
  @tasks.modal_cancel.click
end

Then('this task should not be displayed on the list') do
  # Validating via Search
  # @tasks.search(@task_to_remove['title'])
  # expect(@tasks.page_content).to have_content 'Hmm... nenhuma tarefa encontrada :('

  # Validating without using Search
  @tasks.wait_for_items
  sleep 1
  displayed = false
  @tasks.items.each do |item|
    if item.text.include?(@task_to_remove['title'])
      displayed = true
      break
    end
  end
  expect(displayed).to be false
end

Then('this task should still be displayed on the list') do
  @tasks.search(@task_to_remove['title'])
  expect(@tasks.items.first).to have_content @task_to_remove['title']
end


### Remove all tasks ###
Given('I want to remove all tasks') do
  until @tasks.page.has_content?'nenhuma tarefa cadastrada :|'
    @tasks.wait_for_items
    @removable_task = @tasks.items.first
    puts @removable_task.text
    @removable_task.find('#delete-button').click
    @tasks.modal_confirm.click
    @tasks.wait_for_items
  end

  puts 'All tasks removed! :D' if @tasks.page.has_content?'nenhuma tarefa cadastrada :|'
end