json.array! @contents do |content|
  p content.name
  json.id content.id
  json.name content.name
  json.name_jpn content.name_jpn
end