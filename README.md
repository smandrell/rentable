# PropertyPad

## Overview
This application is a property management tool that allows users to create, search, and manage properties and their associated units. It is built using Ruby on Rails and styled with TailwindCSS.

## Getting Started

### Prerequisites
- Ruby 3.3.4
- Rails 7.2.1
- Node.js and Yarn
- SQLite3
- Bundler (`gem install bundler`)

### Setup Instructions

**Install Dependencies**
```
bundle install
```

**Setup Database**
```
rails db:create
rails db:migrate
rails db:seed
```

**Build TailwindCSS**
```
rails tailwindcss:build
```

**Run The Server**
```
rails server
```

### Running Tests
```
rails test
```

**Running Specific Tests**
```
rails test:models
rails test:controllers
rails test:system
```

## Notes

- Ensure that TailwindCSS is built every time changes are made to the CSS or HTML.
- This application uses Importmaps for JavaScript management.