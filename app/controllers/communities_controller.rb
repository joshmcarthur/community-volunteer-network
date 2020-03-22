class CommunitiesController < AuthenticatedController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @communities = policy_scope(Community)
    render
  end

  def show
    @community = policy_scope(Community).find_by!(slug: params[:slug])
    if policy(@community).show?
      render
    else
      render :public
    end
  end
end
