Role.delete_all

[
  [1, 'director', '監督', 1],
  [2, 'producer', '制作', 2],
  [3, 'executive producer', '製作総指揮', 3],
  [4, 'assistant director', '助監督', 4],
  [5, 'editor', '編集', 5],
  [6, 'screen writer', '脚本', 6],
  [7, 'original author', '原作', 7],
  [8, 'distributor', '配給', 8],
  [9, 'cinematographer', '撮影', 9],
  [10, 'assistant camera', '撮影助手', 10],
  [11, 'gaffer', '証明', 11],
  [12, 'music', '音楽', 12],
  [13, 'production designer', 'プロダクションデザイン', 13],
  [14, 'costume designer', '衣装', 14],
  [15, 'makeup artist', 'メイク', 15],
  [16, 'hair stylist', 'ヘアスタイリスト', 16],
  [17, 'casting', 'キャスティング', 17],
  [18, 'appearance', '出演', 18],
  [19, 'other', 'その他', 19],
].each do |id, name, name_jpn, sort|
  Role.create!(
    { id: id, name: name, name_jpn: name_jpn, sort: sort }
  )
end