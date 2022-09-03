# Owly

I designed this task management or to-do app for myself. Every time I plan to go to somewhere, I make sure to have my to-do prepared the day before. So, I created this app to meet all my needs as a pro to-do app user!

My feedback as a user is that the app needs to be improved, both UI-wise and feature-wise, so it is still under development.😁

Implementation of this app is NOT yet done, UI is not fancy at all. But building blocks are done and core features are implemented.

# Development

This app has 3 flavors, `dev`, `free` and `paid`. For now I'm focusing on `dev` and `free`, the `paid` one will probably only be used for educational purposes in the future when working with different payment providers and overcoming challenges and trying to learn more about them.

## Backend

For backend I used [NHost](https://nhost.io/). While I haven't had a chance to work with all of their features yet, my experience has been outstanding so far.

### DEV

![dev](./docs/readme/images/dev.png)

For local development we can use NHost CLI. Setting it up is very easy and straightforward. You can read more about it from [develop locally](https://docs.nhost.io/platform/overview/get-started-with-nhost-cli#develop-locally) documentation.

#### Run in DEV mode

When everything is up and docker containers are running, we can use the following simple script to create the local database and fill it with the development's data:

Inside `server` directory there is a shell script that you can run it:

```bash
sh run_server.bash
```

There is a user with the following credentials that you can test the app with:

```text
email: test@test.com
password: 12345678
```

Now when server is up and running, we need to run the app on `dev` flavor.

### Free

![free](./docs/readme/images/free.png)

This flavor is for pushing the tested implemented features to users of the app to the NHost server we created for.

There is a `production` branch that when we push to it, it will pushes the changes to NHost.
<!-- Also there is a CI/CD configured on `production` branch that when we create a release out of it, it triggers CircleCI pipeline. We will use this to push to app stores.(Probably?!. Currently, it runs tests, but no release will be issued before we push the app to app stores!) -->

#### Run in FREE mode

In order to use a real database and allow others to test it, we need to create an account in NHost and migrate changes to the database.

Then all we need to do is to simply update `nhostBackendUrl` in the `app` => `private_credential` => `nhost.dart` and finally run the app on `free` flavor.

### Paid

![paid](./docs/readme/images/paid.png)

Nothing fancy for now!(With the exception of those heart emojis in the logo! :DD)
