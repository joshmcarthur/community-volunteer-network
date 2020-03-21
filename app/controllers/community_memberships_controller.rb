class CommunityMembershipsController < AuthenticatedController
  def new
    community
    capabilities
    build_community_membership
    render
  end

  def create
    build_community_membership.assign_attributes(community_membership_params)
    return redirect_to community_path(community.slug), notice: t(".success") if @community_membership.save

    capabilities
    render :new
  end

  private

  def build_community_membership
    @community_membership = policy_scope(community.memberships).build(user: current_user)
  end

  def community
    @community ||= policy_scope(Community).find_by!(slug: params[:community_slug])
  end

  def capabilities
    @capabilities ||= policy_scope(Capability)
  end

  def community_membership_params
    params.require(:community_membership).permit(:street_id, capability_ids: [])
  end
end
