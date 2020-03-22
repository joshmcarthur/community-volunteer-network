class StreetSocialNetworksController < AuthenticatedController
  def new
    street
    build_social_network
    render :new
  end

  def create
    street
    @social_network = build_social_network
    @social_network.assign_attributes(social_network_params)
    return redirect_to(@street.community, notice: t(".success")) if @social_network.save

    render :new
  end

  private

  def street
    @street ||= policy_scope(Street).find(params[:street_id])
  end

  def build_social_network
    policy_scope(street.social_networks).build
  end

  def social_network_params
    params.require(:street_social_network).permit(:network, :link)
  end
end
