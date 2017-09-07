### Node.js REST - test

* npm i -g swagger
* swagger project create -f restify myProject
* cd myProject
* npm i -S restify-jwt

### JWT as middleware
```
app.use(jwt({ secret: 'shhhhhhared-secret'}).unless({path: ['/token']}))
```

##### Auto signed ssl cert for https @ localhost:
```
openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out cert.pem
```
