# XCash

## Requirements

* Ruby version: 2.1.2
* System dependencies: PostgreSQL

## Configuration

## Install

```bash
bundle install
# Create and set up database
rake db:setup
```

* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...

## Testing

```bash
rake
```

## Documentation

### Generate documentation

```bash
rake doc
```

### Run documentation server while developing app

```bash
yard server
```

## Update

```bash
# Save hotfixes on the server
git add .
git stash save

# Update code
git pull origin master

# Install dependencies
bundle install

# Update and seed database
rake db:migrate db:seed
```

Please feel free to use a different markup language if you do not plan to run `rake doc:app`.

## Data Schema

```bash
rails g resource Stock::Constituent name:string amount:decimal measure:string

rails g resource Store::Category name:string color:string check_age:boolean show_recipe:boolean parent:belongs_to lft:integer rgt:integer depth:integer
rails g resource Store::Recipe name:string category:belongs_to price:decimal color:string check_age:boolean show_recipe:boolean
rails g resource Store::RecipeComponent recipe:belongs_to amount:decimal measure:string constituent:belongs_to

rails g resource Store::Menu name:string 
rails g resource Store::MenuItem menu:belongs_to recipe:belongs_to

rails g resource Store::Order cost:decimal
rails g resource Store::OrderItem order:belongs_to recipe:belongs_to amount:integer cost:decimal

rails g resource Stock::Order due_at:datetime
rails g resource Stock::OrderItem order:belongs_to constituent:belongs_to amount:decimal measure:string
```
