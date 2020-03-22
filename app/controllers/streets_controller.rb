class StreetsController < AuthenticatedController
  def google_place
    @street = Street.where(name: params[:street_name], community: community).first_or_create!(
      google_places_id: params[:google_places_id]
    )

    render json: @street
  end

  def community
    @community ||= policy_scope(Community).find_by!(slug: params[:community_slug])
  end
end
