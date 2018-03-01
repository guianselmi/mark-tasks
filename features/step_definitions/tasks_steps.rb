Given('I have a new task with:') do |table|
  @task_table = table.rows_hash
  @task_table['title'] = "#{@task_table['title']} - #{Faker::Lorem.characters(10)}"
end

Given("I want to tag this task with:") do |table|
  @tags = table.hashes
end

When('I register this task') do
  @tasks.new_task.click
  @tasks.add.new_task(@task_table, @tags)
end

Then('I see this task registered with status {string}') do |task_status|
  expect(page).to have_content task_status
end
