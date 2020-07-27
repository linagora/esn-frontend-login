# esn-frontend-login

Login SPA for OpenPaaS.
The application is used to allow developers to authenticate with basic auth while they are working on other 'business' SPA:

1. The business SPA will redirect to `/login` where this app is mounted with the help of webpack-dev-server
2. This login SPA will do a `/api/login` HTTP POST to the OpenPaaS backend
3. This login SPA will redirect the user to the business SPA on authentication success

## Project setup

```
npm install
```

### Compiles and hot-reloads for development

```
npm run serve
```

Will launch the application on `http://localhost:4000`. The webpack-dev-server of the business SPA is configured to proxify `http://localhost:9900/login` to the current app.
