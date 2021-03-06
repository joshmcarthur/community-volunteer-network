Rails.application.routes.draw do
  namespace :admin do
    resources :communities
    resources :community_memberships
    resources :streets
    resources :users
    resources :community_moderators
    resources :street_social_networks
    resources :capabilities
    resources :features

    root to: "users#index"
  end

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  ##
  # Workaround a "bug" in lighthouse CLI
  #
  # Lighthouse CLI (versions 5.4 - 5.6 tested) issues a `GET /asset-manifest.json`
  # request during its run - the URL seems to be hard-coded. This file does not
  # exist so, during tests, your test will fail because rails will die with a 404.
  #
  # Lighthouse run from Chrome Dev-tools does not have the same behaviour.
  #
  # This hack works around this. This behaviour might be fixed by the time you
  # read this. You can check by commenting out this block and running the
  # accessibility and performance tests. You are encouraged to remove this hack
  # as soon as it is no longer needed.
  #
  if defined?(Webpacker) && Rails.env.test?
    # manifest paths depend on your webpacker config so we inspect it
    manifest_path = Webpacker::Configuration
                    .new(root_path: Rails.root, config_path: Rails.root.join("config/webpacker.yml"), env: Rails.env)
                    .public_manifest_path
                    .relative_path_from(Rails.root.join("public"))
                    .to_s
    get "/asset-manifest.json", to: redirect(manifest_path)
  end

  resources :communities, path: :c, param: :slug, only: %i[show] do
    resource :community_memberships, path: :membership, shallow: true
    resources :streets, only: %i[] do
      get "google_place/:place_id" => "streets#google_place", on: :collection
    end
  end

  resources :streets, only: %i[] do
    resources :social_networks, controller: :street_social_networks, only: %i[new create]
  end

  resources :communities, only: %i[index]

  get "/c/:community_slug/join" => redirect("/c/%{community_slug}/membership/new")
  get "privacy", to: "home#privacy"
  get "terms", to: "home#terms"
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
