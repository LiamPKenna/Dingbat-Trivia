Rails.application.routes.draw do
  root to: 'rooms#new'
  get 'rooms/new'
  get 'rooms/join'
  get 'rooms/:room_id/players/:id', to: 'rooms#show', as: 'player'
  get 'rooms/:room_id', to: 'rooms#host', as: 'room'
  post 'rooms', to: 'rooms#create'
  post 'rooms/join', to: 'rooms#new_player'
  mount ActionCable.server => '/cable'
end
