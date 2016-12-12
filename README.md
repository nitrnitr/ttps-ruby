# ttps-ruby
Trabajo final de la cursada Taller de Tecnologías de Producción de Software - Opción Ruby

# Instalación

```
git clone https://github.com/nitrnitr/ttps-ruby
cd ttps-ruby
bundle install
bundle exec rake db:create db:migrate db:seed
```

# Ejecución

```
bundle exec rails s
```

# Tests

```
bundle exec rake db:drop db:create db:migrate test
```
