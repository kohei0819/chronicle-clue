module ModuleMulti
  def build_multi_select(model, col, params)
    if params.blank?
      return
    end
    values = {}
    params.each_with_index do |value, cnt|
      model.build col => value
    end
  end
end
