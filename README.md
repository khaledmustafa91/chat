This is a chat system through this app you can create applications, chat to each application and message for each chats,
can search on chat messages

****Tools i have used****

1- `elasticsearch` For searching on chat messages

2- `Rabbitmq` for insert messages and chats to database

3- `Sidekiq` for updating Counts colums

in th following steps will explain how you can use this sysyem with examples


First run this command to build the App

```
docker-compose build
```
Then up your App
```
docker-compose up
```

There is multiple endpoints avalilable to you
First endpoint responsible for creating a new application

```
POST /applications
```
JSON example of request
```json
{
  "application": {
        "name": "App #1"
    }
}
```

JSON example of response
```json
{
   "application": {
        "name": "App #1",
        "token": "8d6074d115394c14bd50f093d",
        "chats_count": null,
        "created_at": "2022-11-08T23:18:34.000Z",
        "updated_at": "2022-11-08T23:18:34.000Z"
    }
}
```
