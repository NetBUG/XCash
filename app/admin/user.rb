ActiveAdmin.register User do
  menu priority: 4

  decorate_with 'UserDecorator'

  index do
    selectable_column
    id_column
    column :email
    column :sign_in_count
    column :current_sign_in, sortable: :current_sign_in_at
    column :last_sign_in, sortable: :last_sign_in_at
    column :reset_password_sent_at
    column :roles do |user|
      user.roles.to_a.sort.to_sentence
    end
    column :timestamps
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
    end
    f.inputs :password, :password_confirmation, title: :password
    f.inputs do
      f.input :roles, as: :check_boxes, collection: User.roles.options
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :email, :password, :password_confirmation, :roles
end
