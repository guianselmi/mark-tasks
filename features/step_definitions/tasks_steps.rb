### Register task ###
Given('I have a new task with:') do |table|
  @task_table = table.rows_hash
  @task_table['title'] = "#{@task_table['title']}: #{Faker::LordOfTheRings.location}"
end

Given("I want to tag this task with:") do |table|
  @tags = table.hashes
end

Given("I had already registered this task and hadn't realized") do
  @tasks.new_task.click
  @tasks.add.new_task(@task_table, @tags)
end

When('I register this task') do
  @tasks.new_task.click
  @tasks.add.new_task(@task_table, @tags)
end

Then('I see this task registered with status {string}') do |task_status|
  @tasks.wait_for_items
  expect(@tasks.items.first).to have_content task_status

  @tasks.search(@task_table['title'])
  expect(@tasks.items.size).to eql 1
end

Then("I should see the message {string} when trying to register") do |message|
  expect(@tasks.add.alert.text).to eql message
end

### Remove task ###
Given('I have a registered task') do
  @task_to_remove = {
    'title' => "Task to be removed",
    'date' => '01/06/2018'
  }
  @tags = []

  @tasks.new_task.click
  @tasks.add.new_task(@task_table, @tags)
end

When("I request the removal of this task") do
  @tasks.remove_by_title(@remove_first_task['title'])
  sleep 5
end

When("confirm this request") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("this task should not be displayed on the list") do
  pending # Write code here that turns the phrase above into concrete actions
end
