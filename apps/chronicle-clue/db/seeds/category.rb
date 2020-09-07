[
  ['1', 'action', 'アクション', null, 1, 1],
  ['2', 'car action', 'カーアクション', 1, 2, 2],
  ['3', 'karate', '空手', 1, 3, 3],
  ['4', 'kung fu', 'カンフー', 1, 4, 4],
  ['5', 'gang', 'ギャング', 1, 5, 5],
  ['6', 'crime', '犯罪', 1, 6, 6],
].each do |id, name, name_jpn, mark, parent, sort|
  Category.create!(
    { id: id, name: name, name_jpn: name_jpn, mark: mark, parent: parent, sort: sort}
  )
end