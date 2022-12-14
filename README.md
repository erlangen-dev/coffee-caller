# coffee-caller

## Architecture

```mermaid
    C4Context
      title System Context diagram for CoffeeCaller
      Boundary(b0, "CoffeeCaller") {
        System(CoffeeCallerBackend, "Backend")
        System(CoffeeCallerWebFrontend, "Web Frontend")
        System(CoffeeCallerDesktopFrontend, "Desktop Frontend")
        System(CoffeeCallerMobileFrontend, "Mobile Frontend")
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

### Mobile-UI
- Install [fvm](https://fvm.app)
- Run `fvm flutter run` to start the app
- ???
- Profit!

### Rust
- Install [rust/cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html)
- Run `cargo run` in the `frontend-desktop` folder to start the app
- ???
- Profit!

Happy coding :)
