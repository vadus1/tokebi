ActiveAdmin.register Product do
  permit_params *Product.attribute_names
end
