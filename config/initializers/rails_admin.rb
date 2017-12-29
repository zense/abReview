RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  config.show_gravatar = true

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

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Page do
    field :title
    field :slug
    field :content, :ck_editor
  end

  config.model Review do
    include_all_fields # all other default fields will be added after, conveniently
    field :comments, :ck_editor
    field :status, :enum do
      enum_method do
        :statuses
      end
    end
  end
  config.model AbstractDoc do
    include_all_fields # all other default fields will be added after, conveniently
    field :status, :enum do
      enum_method do
        :statuses
      end
    end
    field :attachment, :carrierwave
  end
end
