class CommunitiesController < AuthenticatedController
  def index
    @communities = policy_scope(Community)
    render
  end
end
