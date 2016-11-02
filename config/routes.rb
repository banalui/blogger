Rails.application.routes.draw do
	root to: 'articles#index'
	resources :articles do
  		resources :comments
  		resources :attachments
	end
	resources :tags
end
