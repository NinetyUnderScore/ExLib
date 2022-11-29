# ExLib
An importable library of useful exploit functions. Designed to work with [Synapse X](https://x.synapse.to/).

### Import
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/NinetyUnderScore/ExLib/main/Main.lua"))()
```


<br>


## Objects

### `LP`
LocalPlayer

### `Char`
LocalPlayer's Character


<br>


## Functions

### `Player(String PartialName)`
Returns player object given complete or incomplete player name case insensitive.

### `Character(String PartialName)`
Returns player character object given complete or incomplete player name case insensitive.

### `LaunchUA(Vec3 Target, Float Force, Int Loops)`
Applies `Force` velocity towards `Target`, `Loops` times to unanchored parts in which client has network ownership over excluding LocalPlayer.

### `VelocityUA(Vec3 Velocity, Int Loops)`
Applies `Velocity`, `Loops` times to unanchored parts in which client has network ownership over excluding LocalPlayer.
