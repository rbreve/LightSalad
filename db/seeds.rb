categories = ["Technology", "Business", "Gaming", "Science"]
categories.each do |cat|
  Category.find_or_create_by_title(cat)
end