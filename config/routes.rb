# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                                  root GET    /                                                                                        pages#home
#       random_multiple_choice_question GET    /multiple_choice_questions/random(.:format)                                              multiple_choice_questions#random
#      multiple_choice_questions_random POST   /multiple_choice_questions/random(.:format)                                              multiple_choice_questions#check_answer
#            random_fill_blank_question GET    /fill_blank_questions/random(.:format)                                                   fill_blank_questions#random
#           fill_blank_questions_random POST   /fill_blank_questions/random(.:format)                                                   fill_blank_questions#check_answer
#                          new_question GET    /quizzes/:quiz_id/new(.:format)                                                          questions#new
#                             questions POST   /quizzes/:quiz_id(.:format)                                                              questions#create
#                             take_quiz GET    /quizzes/:id/take(.:format)                                                              quizzes#take
#                                       POST   /quizzes/:id/take(.:format)                                                              quizzes#check_answer
#             multiple_choice_questions GET    /multiple_choice_questions(.:format)                                                     multiple_choice_questions#index
#                                       POST   /multiple_choice_questions(.:format)                                                     multiple_choice_questions#create
#          new_multiple_choice_question GET    /multiple_choice_questions/new(.:format)                                                 multiple_choice_questions#new
#         edit_multiple_choice_question GET    /multiple_choice_questions/:id/edit(.:format)                                            multiple_choice_questions#edit
#              multiple_choice_question GET    /multiple_choice_questions/:id(.:format)                                                 multiple_choice_questions#show
#                                       PATCH  /multiple_choice_questions/:id(.:format)                                                 multiple_choice_questions#update
#                                       PUT    /multiple_choice_questions/:id(.:format)                                                 multiple_choice_questions#update
#                                       DELETE /multiple_choice_questions/:id(.:format)                                                 multiple_choice_questions#destroy
#                  fill_blank_questions GET    /fill_blank_questions(.:format)                                                          fill_blank_questions#index
#                                       POST   /fill_blank_questions(.:format)                                                          fill_blank_questions#create
#               new_fill_blank_question GET    /fill_blank_questions/new(.:format)                                                      fill_blank_questions#new
#              edit_fill_blank_question GET    /fill_blank_questions/:id/edit(.:format)                                                 fill_blank_questions#edit
#                   fill_blank_question GET    /fill_blank_questions/:id(.:format)                                                      fill_blank_questions#show
#                                       PATCH  /fill_blank_questions/:id(.:format)                                                      fill_blank_questions#update
#                                       PUT    /fill_blank_questions/:id(.:format)                                                      fill_blank_questions#update
#                                       DELETE /fill_blank_questions/:id(.:format)                                                      fill_blank_questions#destroy
#                        quiz_questions POST   /quizzes/:quiz_id/questions(.:format)                                                    questions#create
#                     new_quiz_question GET    /quizzes/:quiz_id/questions/new(.:format)                                                questions#new
#                    edit_quiz_question GET    /quizzes/:quiz_id/questions/:id/edit(.:format)                                           questions#edit
#                         quiz_question PATCH  /quizzes/:quiz_id/questions/:id(.:format)                                                questions#update
#                                       PUT    /quizzes/:quiz_id/questions/:id(.:format)                                                questions#update
#                                       DELETE /quizzes/:quiz_id/questions/:id(.:format)                                                questions#destroy
#                               quizzes GET    /quizzes(.:format)                                                                       quizzes#index
#                                       POST   /quizzes(.:format)                                                                       quizzes#create
#                              new_quiz GET    /quizzes/new(.:format)                                                                   quizzes#new
#                             edit_quiz GET    /quizzes/:id/edit(.:format)                                                              quizzes#edit
#                                  quiz GET    /quizzes/:id(.:format)                                                                   quizzes#show
#                                       PATCH  /quizzes/:id(.:format)                                                                   quizzes#update
#                                       PUT    /quizzes/:id(.:format)                                                                   quizzes#update
#                                       DELETE /quizzes/:id(.:format)                                                                   quizzes#destroy
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'quizzes#index'
  get 'multiple_choice_questions/random', to: 'multiple_choice_questions#random', as: 'random_multiple_choice_question'
  post 'multiple_choice_questions/random', to: 'multiple_choice_questions#check_answer'
  get 'fill_blank_questions/random', to: 'fill_blank_questions#random', as: 'random_fill_blank_question'
  post 'fill_blank_questions/random', to: 'fill_blank_questions#check_answer'
  get 'quizzes/:quiz_id/new', to: 'questions#new', as: 'new_question'
  post 'quizzes/:quiz_id', to: 'questions#create', as: 'questions'
  get 'quizzes/:id/take', to: 'quizzes#take', as: 'take_quiz'
  post 'quizzes/:id/take', to: 'quizzes#check_answer'
  resources :multiple_choice_questions, only: [:index, :show, :create, :update, :destroy, :new, :edit]
  resources :fill_blank_questions, only: [:index, :show, :create, :update, :destroy, :new, :edit]
  resources :quizzes, only: [:index, :show, :create, :update, :destroy, :new, :edit] do
    resources :questions, only: [:create, :update, :destroy, :new, :edit]
  end
end
