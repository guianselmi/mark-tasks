Given('I have a new task with:') do |table|
  @task_table = table.rows_hash
end

Given("I want to tag this task with:") do |table|
  @tags = table.hashes
end

When('I register this task') do
  @tasks.new_task.click
  @tasks.add.new_task(@task_table, @tags)
end

Then('I see this task registered with status {string}') do |_string|
  pending # Write code here that turns the phrase above into concrete actions
end
