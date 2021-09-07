json.array!(@friend) do |friend|
  json.name friend.first_name
  json.link 'localhost:3000/search?search=' +
                CGI.escape(friend.first_name)
end