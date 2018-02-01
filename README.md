# PmBot

## Relevant issue

https://github.com/revelrylabs/devtools/issues/56

## Development plan

So as to achieve the following AC:

> ## Scenario: Move Ticket to In Progress, Get Prompted for Update
>
> Given I am a Revelry employee signed in to GitHub
>
> * [ ] When I move a ticket to `In Progress`
> * [ ] And when I assign myself to the ticket
> * [ ] And when I have not left a comment within 60 minutes of moving the ticket to `In Progress`
> * [ ] Then PM Bot posts a comment on the ticket:
>
> ```
> @[assigned user] - it's been an hour. What's your plan?
> ```

Our proposal is as follows:

* Leverage GitHub webhooks to signal when issue statuses change.

Provided:

* The webhook action is equivalent with `labeled`; and
* The `label` property includes a `name` attribute equivalent with `in progress`;

Then:

* Set a timer, which after passage of sixty minutes:
* Scrapes the issue's comments; and
* Determines whether the assigned developer has added a new comment;

Provided:

* Yes, terminate the procedure;

Otherwise:

* POST to the ticket the following message:

```
@[assigned user] - it's been an hour. What's your plan?
```

## Phoenix

To start your Phoenix server:

* Install dependencies with `mix deps.get`
* Create and migrate your database with `mix ecto.create && mix ecto.migrate`
* Install Node.js dependencies with `cd assets && npm install`
* Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

* Official website: http://www.phoenixframework.org/
* Guides: http://phoenixframework.org/docs/overview
* Docs: https://hexdocs.pm/phoenix
* Mailing list: http://groups.google.com/group/phoenix-talk
* Source: https://github.com/phoenixframework/phoenix
