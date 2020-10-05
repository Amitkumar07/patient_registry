class SearchService

  def search(search_params, limit)
    page = search_params[:page].present? ? search_params[:page].to_i : 1
    limit = limit || Patient.count
    search = Patient.search do
      fulltext search_params[:term] if search_params[:term].present?
      with(:is_insured, search_params[:is_insured] == 'true') if search_params.has_key?(:is_insured)
      order_by search_params[:sort_by].to_sym, search_params[:order].to_sym if search_params[:sort_by].present? && search_params[:order].present?
      paginate :page => page, :per_page => limit
    end
    return search.results, search.total, search.results.total_pages
  end

end