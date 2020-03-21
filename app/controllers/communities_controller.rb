class CommunitiesController < AuthenticatedController
  def index
    @communities = policy_scope(Community)
    render
  end

  def show
    @community = policy_scope(Community).find_by!(slug: params[:slug])
    render
  end
end
