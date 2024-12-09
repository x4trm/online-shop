# E-Commmerce Store
This is a simple e-commerce store build with Ruby on Rails. The application features user authentication, roles (admin and user), cart functionality, and checkout process. The project uses Devise for authentication, Tailwind CSS for styling, and Docker for containerization.
## Features
- User Authentication: Sign up, login in, and manage accounts using Devise
- Roles: Admin and user roles with different access levels
- Admin Panel: Manage the store, products, and orders
- Cart: Add, view, and remove items from the cart
- Checkout: Enter shipping information and place orders.
- Styling: TailwindCSS for responsive and modern UI
- Containerization: Docker for easy setup and deployment.
## Setup
```bash
docker-compose up --build
docker-compose run web rake db:create db:migrate
docker-compose run web rake db:seed
```