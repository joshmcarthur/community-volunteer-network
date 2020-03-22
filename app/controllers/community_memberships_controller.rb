class CommunityMembershipsController < AuthenticatedController
  def new
    community
    return redirect_to community_path(community.slug), alert: t(".already_a_member") if already_a_member?

    capabilities
    build_community_membership
    render
  end

  def create
    build_community_membership.assign_attributes(community_membership_params)

    save
  end

  def edit
    capabilities

    @community_membership = current_user.community_memberships.find_by!(community_id: community)
    render
  end

  def update
    @community_membership = current_user.community_memberships.find_by!(community_id: community)
    @community_membership.assign_attributes(community_membership_params)

    save
  end

  private

  def save
    return redirect_to community_path(community.slug), notice: t(".success") if @community_membership.save

    capabilities
    render @community_membership.persisted? ? :new : :edit
  end

  def already_a_member?
    policy_scope(community.memberships).where(user_id: current_user).exists?
  end

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
