ActiveAdmin.register Film do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :content_id, :outline, :story, :original, :website, :opendate, :running_time, :productino, :distributed, :budget, :box_office
  #
  # or
  #
  # permit_params do
  #   permitted = [:content_id, :outline, :story, :original, :website, :opendate, :running_time, :productino, :distributed, :budget, :box_office]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
