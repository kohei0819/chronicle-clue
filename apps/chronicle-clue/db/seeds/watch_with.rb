Role.delete_all

[
  [1, 'alone', '一人', 1],
  [2, 'partner', 'パートナー', 2],
  [3, 'family', '家族', 3],
  [4, 'friend', '友人', 4],
  [5, 'relatives', '親族', 5],
  [99, 'other', 'その他', 99],
].each do |id, name, name_jpn, sort|
  WatchWith.create!(
    { id: id, name: name, name_jpn: name_jpn, sort: sort }
  )
end