fiction = Category.create(name: "Fiction")
non_fiction = Category.create(name: "Non-Fiction")

author1 = Author.create(name: "Joe Doe")
author2 = Author.create(name: "Jack Smith")
author3 = Author.create(name: "Bob Green")
author4 = Author.create(name: "Kate Ann")
author5 = Author.create(name: "Emily Johnson")
author6 = Author.create(name: "Michael Brown")
author7 = Author.create(name: "Jessica Davis")
author8 = Author.create(name: "James Wilson")
author9 = Author.create(name: "Sarah Miller")

authors = [author1, author2, author3, author4, author5, author6, author7, author8, author9]

30.times do |i|
  category = [fiction, non_fiction].sample
  page_count = rand(250..500)
  book = Book.create(
    name: "#{category.name} Book #{rand(1..100)}",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent dictum tellus nec arcu rhoncus vulputate. Aenean feugiat metus vitae nisi efficitur",
    page_count: page_count,
    contents: "Table of contents for #{category.name} Book #{rand(1..100)}.",
    category: category
  )

  book.authors << authors.sample(rand(1..3))
end

