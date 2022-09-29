# coffee-caller

## Architecture

```mermaid
    C4Context
      title System Context diagram for CoffeeCaller
      Boundary(b0, "CoffeeCaller") {
        System(CoffeeCallerBackend, "Coffee Caller Backend")
        System(CoffeeCallerWebFrontend, "Coffee Caller Web Frontend")
        System(CoffeeCallerDesktopFrontend, "Coffee Caller Desktop Frontend")
        System(CoffeeCallerMobileFrontend, "Coffee Caller Mobile Frontend")
      }
      BiRel(CoffeeCallerBackend, CoffeeCallerWebFrontend, "Connects")
      BiRel(CoffeeCallerBackend, CoffeeCallerDesktopFrontend, "Connects")
      BiRel(CoffeeCallerBackend, CoffeeCallerMobileFrontend, "Connects")
      UpdateElementStyle(CoffeeCallerBackend, $fontColor="red", $bgColor="grey", $borderColor="red")
      UpdateLayoutConfig($c4ShapeInRow="2", $c4BoundaryInRow="1")
```

Communication works as follows:

```mermaid
sequenceDiagram
    actor Bob
    actor Alice
    participant Backend

    Bob->>Backend: {"name": "Bob", "type": "join"}
    Backend->>Alice: {"status": "announced", "participants": ["Bob"], "messages": [{"name": "Bob", "type": "join"}]}
    Backend->>Bob: {"status": "announced", "participants": ["Bob"], "messages": [{"name": "Bob", "type": "join"}]}
    Alice->>Backend: {"name": "Alice", "type": "join"}
    Backend->>Bob: {"status": "announced", "participants": ["Bob", "Alice"], "messages": [{"name": "Bob", "type": "join"}, {"name": "Alice", "type": "join"}]}
    Backend->>Alice: {"status": "announced", "participants": ["Bob", "Alice"], "messages": [{"name": "Bob", "type": "join"}, {"name": "Alice", "type": "join"}]}
    Alice->>Backend: {"name": "Alice", "type": "start"}
    Backend->>Bob: {"status": "inProgress", "participants": ["Bob", "Alice"], "messages": [...]}
    Backend->>Alice: {"status": "inProgress", "participants": ["Bob", "Alice"], "messages": [...]}
```

## Backend setup

### With node

- Install [node](https://nodejs.org/en/)
- Run `npm install --global yarn` to install yarn
- Run `yarn` to install all dependencies
- Run `yarn serve` to start backend in watch mode
- Run `yarn start` to start backend

### With docker

- Install [docker](https://www.docker.com/) and [docker-compose](https://docs.docker.com/compose/) if not automatically installed
- Run `docker-compose up`

## Frontend setup

- Install [fvm](https://fvm.app)
- Run `fvm flutter run` to start the app
- ???
- Profit!

Happy coding :)
