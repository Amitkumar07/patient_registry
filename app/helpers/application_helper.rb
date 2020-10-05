module ApplicationHelper

  def asc_sort_link(params={})
    link_to "&uarr;".html_safe, patient_index_path(params.except(:controller,:action).to_unsafe_h)
  end
  def desc_sort_link(params={})
    link_to "&darr;".html_safe, patient_index_path(params.except(:controller,:action).to_unsafe_h)
  end

end

