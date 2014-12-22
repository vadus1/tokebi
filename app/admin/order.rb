ActiveAdmin.register Order do
  permit_params *Order.attribute_names
end
