Book.destroy_all
Author.destroy_all
Category.destroy_all
Promotion.destroy_all
User.destroy_all

fiction = Category.create(name: "Fiction", slug: "fiction")
non_fiction = Category.create(name: "Non-Fiction", slug: "non-fiction")

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

image_files = ['book1.jpg', 'book2.jpg', 'book3.jpg', 'book4.jpg']

ActiveRecord::Base.transaction do
  30.times do |i|
    category = [fiction, non_fiction].sample
    page_count = rand(250..500)
    book = Book.create!(
      name: "#{category.name} Book #{rand(1..100)}",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent dictum tellus nec arcu rhoncus vulputate. Aenean feugiat metus vitae nisi efficitur",
      page_count: page_count,
      contents: "Table of contents for #{category.name} Book #{rand(1..100)}.",
      category: category,
      price: rand(10..50),
      bestseller: [true, false].sample,
      recommended: [true, false].sample,
      slug: "book-#{i + 1}-#{category.name.downcase.gsub(' ', '-')}"
    )

    book.authors << authors.sample(rand(1..3))

    image_file = image_files.sample
    image_path = Rails.root.join('app/assets/images/books', image_file)
    if File.exist?(image_path)
      book.image.attach(
        io: File.open(image_path),
        filename: image_file,
        content_type: 'image/jpeg'
      )
    else
      puts "Warning: Image #{image_file} not found for book #{book.name}"
    end
    sleep(0.1)
  end

  promotion_image_files = ['promo1.jpg', 'promo2.jpg']

  # 2.times do |i|
  #   promotion = Promotion.create!(
  #     title: "Promotion #{i + 1}",
  #     description: "This is the description for Promotion #{i + 1}.",
  #     active: true
  #   )
    
  #   image_file = promotion_image_files[i]
  #   image_path = Rails.root.join('app/assets/images/promotions', image_file)
  #   if File.exist?(image_path)
  #     promotion.image.attach(
  #       io: File.open(image_path),
  #       filename: image_file,
  #       content_type: 'image/jpeg'
  #     )
  #   else
  #     puts "Warning: Image #{image_file} not found for promotion #{promotion.title}. Assigning a default image."
  #     default_image_path = Rails.root.join('app/assets/images/promotions', 'default_promo.jpg')
  #     if File.exist?(default_image_path)
  #       promotion.image.attach(
  #         io: File.open(default_image_path),
  #         filename: 'default_promo.jpg',
  #         content_type: 'image/jpeg'
  #       )
  #     else
  #       puts "Default image not found for promotion #{promotion.title}. Skipping promotion."
  #     end
  #   end
  #   sleep(0.1)
  # end

  admin = User.create!(
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password',
    first_name: 'Admin',
    last_name: 'User',
    phone_number: '123456789',
    address: 'Admin Address',
    role: 'admin'
  )

  user = User.create!(
    email: 'user@example.com',
    password: 'password',
    password_confirmation: 'password',
    first_name: 'User',
    last_name: 'Last User',
    phone_number: '987654321',
    address: 'User Address',
    role: 'user'
  )
end

puts "Seeding completed successfully!"
