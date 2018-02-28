Given('I have a new task with the attributes:') do |table|
  @task_table = table.rows_hash
end

When('I register this task') do
  @tasks.new_task.click
  @tasks.add.new_task(@task_table['title'], @task_table['date'])
end

Then('I see this task registered with status {string}') do |_string|
  pending # Write code here that turns the phrase above into concrete actions
end
