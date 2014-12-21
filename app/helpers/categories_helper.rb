module CategoriesHelper
  def render_cover_for category
    image_cover = category.image? ? image_tag(category.image_url(:thumb), {size: '300x200'}) : image_tag('http://placehold.it/300x200', class: 'thumb')
    link = link_to(image_cover, category_products_path(category), class: 'thumb')

    "<div class='cover'>#{link}</div>".html_safe
  end
end
