module Common
  extend ActiveSupport::Concern

  included do
    # ここにcallback等
  end

  # スコア用
  def self.scores
    scores = Array.new(10) {|idx| 1 ++ idx }
  end

  # 鑑賞場所用
  def self.locations
    {
      1 => '映画館',
      2 => '自宅',
      3 => 'お店',
      4 => '乗り物',
    }
  end

  # 同伴者用
  def self.people
    {
      1 => '一人',
      2 => '友人',
      3 => '恋人/配偶者',
      4 => '家族',
      5 => 'その他親族',
    }
  end

  private

end
