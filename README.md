# Yet Another Chip 8 Emulator

## What is it?

This project is a Chip 8 emulator (interpreter) written in [Squeak Smalltalk](https://squeak.org).

The original goal of these project was to learn how to code a simple emulator in smalltalk.

![alt text](https://github.com/thiagoslino/Chip8-Squeak/blob/master/chip-8.png "Chip-8 for Squeak")


## Installing and running a ROM
 1. Make sure you have Metacello installed, running:
```Smalltalk
Installer ensureRecentMetacello.
```
 2. Load the project with:
```Smalltalk
Metacello new
  baseline: 'Chip8';
  repository: 'github://thiagoslino/Chip8-Squeak:master';
  load
```

 3. Running a ROM
```Smalltalk
Chip8Presenter runProgram: '/path/to/rom/filename'.
```
The CHIP-8 had no specified clock speed, so we'll use a delay to control it. Different games run best at different speeds, so we can control it here.

## ROMs
A collection of public domain ROMs that can be used with this emulator can be found at:
 - https://www.zophar.net/pdroms/chip8/chip-8-games-pack.html
 - https://johnearnest.github.io/chip8Archive/?sort=platform

## Regular Keys

The original Chip 8 had a keypad with the numbered keys 0 - 9 and A - F (16
keys in total). Without any modifications to the emulator, the keys are mapped
as follows:

| Chip 8 Keypad | Keyboard Key |
| :--------: | :----------: |
| `1` `2` `3` `C` | `1` `2` `3` `4` |
| `4` `5` `6` `D` | `Q` `W` `E` `R` |
| `7` `8` `9` `E` | `A` `S` `D` `F` |
| `A` `0` `B` `F` | `Z` `X` `C` `V` |

## TODO
* Automatic ROMs download from Zophar
* Better morphic configuration (to configure speed, roms download button, pause, etc...)

## Resources
* https://en.wikipedia.org/wiki/CHIP-8
* http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/
* http://devernay.free.fr/hacks/chip8/C8TECH10.HTM
