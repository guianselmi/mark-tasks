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