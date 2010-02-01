module CategoriesHelper
  def subcategories(category_id)
    html=""
    categories = Category.find(:all, :conditions=>["category_id=?", category_id])
    for category in categories
      html += "
      <tr> <td></td>
          <td>#{category.title}</td>
          <td><a href=#{category_path(category)}>Show</a></td>
          <td><a href=#{edit_category_path(category)}>Edit</a></td>
          <td><a href=\"#{category_path(category)}\" onclick=\"if (confirm('Are you sure?')) { var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var m = document.createElement('input'); m.setAttribute('type', 'hidden'); m.setAttribute('name', '_method'); m.setAttribute('value', 'delete'); f.appendChild(m);f.submit(); };return false;\">Destroy</a></td>
        	  </tr>
      
              "
    end
    html
  end
end
