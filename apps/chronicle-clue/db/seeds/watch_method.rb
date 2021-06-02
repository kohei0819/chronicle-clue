Role.delete_all

[
  [1, 'theatre', '映画館', 1],
  [2, 'TV', 'テレビ', 2],
  [3, 'Netflix', 'Netflix', 3],
  [4, 'Hulu', 'Hulu', 4],
  [5, 'Amazon Prime', 'アマゾンプライムビデオ', 5],
  [6, 'U-NEXT', 'U-NEXT', 6],
  [7, 'VHS', 'VHS', 7],
  [8, 'DVD', 'DVD', 8],
  [9, 'Blu-ray', 'Blu-ray', 9],
  [10, 'Paid channels', '有料チャンネル', 10],
  [11, 'During the move', '移動中', 11],
  [99, 'other', 'その他', 99],
].each do |id, name, name_jpn, sort|
  WatchMethod.create!(
    { id: id, name: name, name_jpn: name_jpn, sort: sort }
  )
end