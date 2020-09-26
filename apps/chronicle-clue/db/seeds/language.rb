Language.delete_all

[
  [1, 'Japanese', '日本語', 1],
  [2, 'English', '英語', 2],
  [3, 'Spanish', 'スペイン語', 3],
  [4, 'French', 'フランス語', 4],
  [5, 'German', 'ドイツ語', 5],
  [6, 'Italian', 'イタリア語', 6],
  [7, 'Portuguese', 'ポルトガル語', 7],
  [8, 'Chinese', '中国語', 8],
  [9, 'Korean', '韓国語', 9],
  [10, 'Hindi', 'ヒンディー語', 10],
  [11, 'Arabic', 'アラビア語', 11],
  [12, 'Bengali', 'ベンガル語', 12],
  [13, 'Russian', 'ロシア語', 13],
].each do |id, name, name_jpn, sort|
  Language.create!(
    { id: id, name: name, name_jpn: name_jpn, sort: sort }
  )
end