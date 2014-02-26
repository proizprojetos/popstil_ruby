PopstilRb::Application.routes.draw do
  #get "sessions/new"
  #get "sessions/create"
  #get "sessions/destroy"
  #get "painel/cadastrar"
  #get "painel/login"
  
  controller :painel do
    get 'painel/cadastrar' => :cadastrar
    post 'painel' => 'painel#salvar'
    get 'painel/meusdados' => :show_dados
    #post 'painel/definirend/:id' => :definir_endereco
    post 'painel/definirendereco/:id' => :definir_endereco, :as => 'definirendereco'
    get 'adicionar_endereco' => :adicionar_endereco
    put 'adicionar_endereco' => :salvar_endereco
    get 'painel/editar' => :editar
    put 'painel/editar' => :update
    get 'painel' => :dashboard
  end
  
  controller :sessions do
    get 'login' => :new
    post 'login'=> :create
    delete 'logout'=> :destroy
  end
  root :to =>'sessions#new'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
