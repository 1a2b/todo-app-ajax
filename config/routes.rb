Todo::Application.routes.draw do

  root 'users#all'

  resources :lists

  resources :users

  resources :tasks
  	patch 'done_tasks/:id' => 'tasks#done', as: 'task_done'
 
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup', 		 to: 'users#new',            via: 'get'
  match '/signin', 		 to: 'sessions#new',         via: 'get'
  match '/signout',		 to: 'sessions#destroy',     via: 'delete'
end
