Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :communities
    resources :features
    resources :streets
    resources :community_memberships
    resources :community_moderators
    resources :capabilities

    root to: "users#index"
  end

  devise_for :users
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
  end

  resources :communities, only: %i[index]

  get "privacy", to: "home#privacy"
  get "terms", to: "home#terms"
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
