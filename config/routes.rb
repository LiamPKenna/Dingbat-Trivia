Rails.application.routes.draw do
  get 'rooms/new'
  get 'rooms/join'
  get 'rooms/:room_id/players/:id', to: 'rooms#show', as: 'player'
  get 'rooms/:room_id', to: 'rooms#host', as: 'room' 
  root to: 'rooms#new'
  mount ActionCable.server => '/cable'
end
