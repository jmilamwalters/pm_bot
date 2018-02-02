# PmBot

## Relevant issue

https://github.com/revelrylabs/devtools/issues/56

## Development roadmap

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

* Set a timer, and after passage of sixty minutes:
* Ensure the issue still exists and that it has not been closed;
* Ensure that the current issue was recently self-assigned;
* Ensure no new comments have been added by the developer who self-assigned the issue;

Provided:

* Yes, terminate the procedure;

Otherwise:

* POST to the ticket the following message:

```
@[assigned user] - it's been an hour. What's your plan?
```

## Resources:

* [GET a single GitHub issue](https://developer.github.com/v3/issues/#get-a-single-issue)
* [GET all events relating to a GitHub issue](https://developer.github.com/v3/issues/events/#list-events-for-an-issue)
* [POST a comment to a single GitHub issue](https://developer.github.com/v3/issues/comments/#create-a-comment)

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
