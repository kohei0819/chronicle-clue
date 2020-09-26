Medium.delete_all

[
  [1, 'films', '映画', 1, 1],
  [2, 'doramas', 'ドラマ', 2, 2],
  [3, 'books', '本', 3, 3],
  [4, 'music', '音楽', 4, 4],
  [5, 'people', '人物', 5, 5]
].each do |id, name, name_jpn, mark, sort|
  Medium.create!(
    { id: id, name: name, name_jpn: name_jpn, mark: mark, sort: sort }
  )
end