require_relative 'sections'

class TasksPage < SitePrism::Page
  section :navbar, Navbar, '#navbar'
  
  element :title, '.header-title h3'
end