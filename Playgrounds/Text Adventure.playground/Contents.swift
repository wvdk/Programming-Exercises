//: # A simple prison break text adventure by Wesley Van der Klomp, July 2016
//: You can move from room to room
//: Find keys
//: Unlock doors
//: That's it. It's pretty basic.

/////////////////////////////////////////////////////////////
// ## Misc thoughts
/////////////////////////////////////////////////////////////

// This project comes in two parts.

// 1. The Game Engine (programmer part)
// Holds all the logic and makes the game work. Has no "content", just the logic and structures needed to make the game run.

// 2. The Implementation (writer part)
// In my case, I've written a short, boring excape from prison game. It's not very much fun to play, but it illustrates how one could use the Game Engine to make something with a longer story (and more hijinks!).


/****************************************************
 
## About the Game Engine

Text Adventures are great because they can be so simple. The user types a command, the game processes that input and if it's valid action command, changes the game state and displays a message. Then awaits it's next instruction.

So let's break that down and talk about what will go on at each stage: Input, processing, output.


Every door has a name. And for every door there is matching key. You can only carry one key at a time.


User inputs consist of two elements: the "user action command", and a "user action object" which the action will be applied to. If the user only provides a lone "user action command", we will attempt to find a default "action object", otherwise it's a failed command.

## In this game Action Commands are
Picking keys up: get <key name>, pickup <key name>, grab <key name>, take <key name>, select <key name>
Droping keys: drop, drop <key name>, throw <key name>
Moving: go <direction>, move <direction>, walk <direction>, run <direction>, hop <direction>, skip <direction>, gallop <direction>, sneek <direction>
Opening doors: unlock <door name>, open <door name>
Misc: help

types of commands
<top level command>
<top level command> <name of object to apply action to>

****************************************************/

/****************************************************

## About the Implementation


## Example
You're a prisoner in a dungon. You wake up one day and all the guards have mysteriously dissapeared. There is a small grey key in your cell. There is a locked door on the Eastwardly wall.
> pick up key
I don't know that command.
> grab key
You've picked up the small grey key.
> walk east
The door is locked.
> unlock door
The door swings open. You can now go East.
> go east
You've exited your little cell into a long hallway going North and South.

****************************************************/

/****************************************************

## Architecture of game engine

protocol Location
-- Neighbor(for: Direction)
-- Items
-- Description
-- doors: Array<Door>
-- keys: Array<Key>

struct Corridor: Location
struct Cell: Location

enum Direction

 typealias Map of Array<object that follows Location protocol>

 */

struct Key {
    let name: String
}

struct Door {
    let name: String
    var unlocked: Bool
}

/*
struct Player (mutable)
-- var currentKey: Optional<Key>
-- var currentLocation: some object that pertains to Location protocol

Command
func valid() throws

typealias Message of String

mutable struct GameStateManager
-- private let player: Player
-- private let map: Map
-- public inputFromUser(command: Command) -> Message
-- private validateCommand -> (valid: Bool, errorMessage: String?)

parse the command
-- break into tokens
-- check first token against list of valid first level tokens
-- if first level token


Create a fuzzy equality checker for checking if user meant, but typed poorly, the name of a game objects (doors and keys)

****************************************************/




