Rails.application.routes.draw do
  
  
  # My Api
  get 'jsoners/ghana/:currency/:money' => 'jsoners#ghana'
  get 'jsoners/dollars/:currency/:money' => 'jsoners#dollars'
  get 'jsoners/euro/:currency/:money' => 'jsoners#euro'
  get 'jsoners/sendmsg/:mtn' => 'jsoners#sendmsg'
  get 'jsoners/validator/:mtn' => 'jsoners#valid'

  get 'admin' => 'admins#index'
  get 'admin/show/:id' => 'admins#show', as: 'show_admin'
  get 'admin/pending' => 'admins#pending'
  get 'admin/past' => 'admins#past'
  get 'admin/activation' => 'admins#activation'
  post 'admin/approve' => 'admins#approve'
  get 'admin/approved/:uid' => 'admins#approved', as: 'admin_approved' 
  get 'admin/aboutsumasika' => 'admins#aboutsumasika', as: 'admin_aboutsumasika'
  get 'admins/addaboutsumasika' 
  post 'admins/create'
  get 'admins/delete/:id' => 'admins#delete', as: 'admin_delete'
  get 'admins/aboutsumasikaedit/:id' => 'admins#aboutsumasikaedit', as: 'admin_aboutsumasikaedit'
  patch 'admins/editcreate'
  get 'admins/experts' => 'admins#experts', as: 'admin_experts'
  get 'admins/addexperts' => 'admins#addexperts', as: 'admin_addexperts'
  post 'admins/expertcreate'
  get 'admins/editexpert/:id' => 'admins#editexpert', as: 'admins_editexpert'
  patch 'admins/expertedit'
  get 'admins/expertdel/:id' => 'admins#expertdel', as: 'admins_expertdel'
  get 'admins/trusted'
  get 'admins/addtrusted'
  post 'admins/trustcreate'
  get 'admins/edittrusted/:id' => 'admins#edittrusted', as: 'admins_edittrusted'
  patch 'admins/trustupdate'
  get 'admins/trustdel/:id' => 'admins#trustdel', as: 'admins_trustdel'
  get 'members/tandc'
  get 'members/privacy'
  
 # Signup Routes
  get 'members/index'
  get 'members/new'
  post 'members/create'
  get 'admin/members/new' => 'members#admin'
  post 'admin/members/create' => 'members#creators'
  get 'members/verifyemail/:token' => 'members#verifyemail', as: 'member_verifyemail'
  
  # Email Verifications and sending
  get 'registrations/fresher'

  # Signin Routes
  get 'sessions/new'
  get  'sessions/destroy' => 'villian#user_destroy'
  post 'sessions/create'
  get 'admin/sessions/new' => 'sessions#admin'
  post 'admin/sessions/create' => 'sessions#creators'
  get 'admin/sessions/destroy' => 'villian#admin_destroy'
  get 'sessions/forgetpwd'
  post 'sessions/resetemail'
  get 'sessions/updatepwd/:token' => 'sessions#updatepwd', as: 'sessions_updatepwd'
  post 'sessions/resetpwd'
  
  # Dashboard Routes
  get 'dashboard/index'
  get 'dashboard/transactions'
  get 'dashboard/transactions/:charge_id' => 'dashboard#transactions_brief', :as => 'dashboard_tbrief'
  get 'dashboard/settings'
  post 'dashboard/create'
  post 'dashboard/details_update'
  post 'dashboard/email_update'
  get 'dashboard/expired'
  get 'dashboard/changepwd'
  post 'dashboard/updatepwd'
  
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
  root 'cras#index'
  post 'cras/contactus' => 'cras#contactus', as: 'cras_contactus'
  get 'cras/tandc'
  get 'cras/privacy'

  resources :charges
  get 'charges/checkdetails'

  
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
