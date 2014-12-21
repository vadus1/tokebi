module ApplicationHelper
  def number_to_price price
    number_to_currency(price, precision: 0)
  end

  def render_cart_menu
    active = request.path == edit_cart_path(current_order.id) ? 'active' : ''

    content_tag :li, class: "cart #{active}" do
      link_to (current_user && active.eql?('active')) ? edit_cart_path(current_order.id) : cart_path(current_order), remote: (!active.eql?('active')) do
        fa_icon "shopping-cart", text: "Cart (#{current_order.items_count})"
      end
    end
  end
end
