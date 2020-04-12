Dummy [Pow](https://powauth.com/) instance to demo Next.js authentication library

# How to use this dummy instance

- Run `docker-compose up` to start services (`-d` to run detached)
- Run `docker-compose stop` to stop and preserve database
- Run `docker-compose down` to stop and cleanup database

## Registering via API

```shell
curl --location --request POST 'http://localhost:4000/api/v1/registration' \
--header 'Content-Type: application/json' \
--data-raw '{
    "user": {
        "email": "test@example.com",
        "password": "1234567890",
        "password_confirmation": "1234567890"
    }
}'
```

## Create new session

```shell
curl --location --request POST 'http://localhost:4000/api/v1/session' \
--header 'Content-Type: application/json' \
--data-raw '{
    "user": {
        "email": "test@example.com",
        "password": "1234567890"
    }
}'
```

More info here [Add API controllers](https://hexdocs.pm/pow/api.html#add-api-controllers)

# Phoenix README

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

# Thanks

- [PSPDFKit for the Docker guide](https://pspdfkit.com/blog/2018/how-to-run-your-phoenix-application-with-docker/)
