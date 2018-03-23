crumb :root do
  link "Home", root_path
end

crumb :users do
  link "ALL Users", users_path
end

crumb :user do |user|
  link user.name, user
  parent :users
end

crumb :blogs do |blogs|
  link "All Blog", blogs_path
  parent :root
end

crumb :blog do |blog|
  link "new blog", blog
  parent :blogs
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
