ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :province_id, :address, :city, :postal_code, :email_address, :credit_card_number, :phone_number

  # or
  #
  # permit_params do
  #   permitted = [:name, :province_id, :address, :city, :postal_code, :email_address, :credit_card_number, :phone_number]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
