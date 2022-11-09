This is a chat system through this app you can create applications, chat to each application and message for each chats,
can search on chat messages

****Tools****

1- `elasticsearch` for chat messages search 

2- `Rabbitmq` for insert messages and chats to database

3- `Sidekiq` for updating columns counts

in th following steps will explain how you can use this system with examples


First run this command to build the App

```
docker-compose build
```
Then up your App
```
docker-compose up
```

There is multiple endpoints avalilable to you

***Applications***

Create applications

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
        "chats_count": 0,
        "created_at": "2022-11-08T23:18:34.000Z",
        "updated_at": "2022-11-08T23:18:34.000Z"
    }
}
```
Show application

```
GET /application/:application_token
```

JSON example of response

```json
{
   "application": {
        "name": "App #1",
        "token": "8d6074d115394c14bd50f093d",
        "chats_count": 0,
        "created_at": "2022-11-08T23:18:34.000Z",
        "updated_at": "2022-11-08T23:18:34.000Z"
    }
}
```
Update application

```
PUT /application/:application_token
```

JSON example of request
```json
{
  "application": {
        "name": "Updated App #1"
    }
}
```

JSON example of response
```json
{
    "application": {
        "name": "Updated App #1",
        "token": "ff93d5516c63294f623b72eee",
        "chats_count": 0,
        "created_at": "2022-11-09T21:35:30.000Z",
        "updated_at": "2022-11-09T21:39:39.000Z"
    }
}
```

Note That, you will use application token on any request of the system

**Chats**

Create chat

**Note:** this endpoint use rabbitmq

```
POST applications/:application_token/chats
```

Show all application chats

```
GET applications/:application_token/chats
```

JSON example of response
```json
{
    "chats": [
        {
            "chat_number": 1,
            "message_count": 0
        }
    ],
    "meta": {
        "total_entries": 1,
        "total_pages": 1,
        "next_page": null,
        "previous_page": null,
        "current_page": 1,
        "per_page": 10
    }
}
```

Show action

```
GET applications/:application_token/chats/:number
```

JSON example of response

```json
{
    "chat": {
        "chat_number": 1,
        "message_count": 0
    }
}
```

**Message**

Create a new message for a specific application to specific chat

```
POST /applications/:application_token/chats/:chat_number/messages
```

Request body
```json
{
  "message": {
    "body": "Hello"
  }
}
```

Read all chat message to specific application

```
GET /applications/:application_token/chats/:chat_number/messages
```

JSON example of response

```json
{
    "messages": [
        {
            "body": "Hello",
            "message_number": 1
        }
    ],
    "meta": {
        "total_entries": 1,
        "total_pages": 1,
        "next_page": null,
        "previous_page": null,
        "current_page": 1,
        "per_page": 10
    }
}
```


Read specific message

```
GET /applications/:application_token/chats/:chat_number/messages/:number
```

Response example

```json
{
    "message": {
        "body": "Hello",
        "message_number": 1
    }
}
```

Update

```
PUT /applications/:application_token/chats/:chat_number/messages/:number
```

JSON example of request body

```json
{
  "message": {
    "body": "Hello my friend"
  }
}
```


Search on specific chat

**Note:** This endpoint used elasticsearch

```
GET /applications/:application_token/chats/:chat_number/messages
```

JSON example of request body
```json
{
    "query": "hello",
}
```

JSON example of response body

```json
{
    "messages": [
        {
            "body": "Hello my friend",
            "message_number": 1
        }
    ],
    "meta": {
        "current_page": 1,
        "per_page": 10
    }
}
```
