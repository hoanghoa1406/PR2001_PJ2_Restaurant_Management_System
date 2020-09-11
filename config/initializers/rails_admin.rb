RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  
   config.authorize_with :cancancan
   
   config.authorize_with do
    unless current_user.try(:admin?)
       flash[:error] = "You are not authorize to access this page!"
      redirect_to main_app.root_path
    end
  end
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    # config.model 'category' do
    #   index dish.limit(1) 

    #   end
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
