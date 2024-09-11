# EE314_Final_Project_Space_Invider
Space Invaders Game - FPGA Verilog Implementation
Overview
This project is a hardware-based implementation of the classic Space Invaders game, designed using Verilog HDL. The game runs on an FPGA platform, utilizing various modules such as trajectory generators, alien sprite memory, and pixel display management to simulate the behavior of aliens moving across the screen.

Players control a spaceship that must shoot down aliens moving in predefined trajectories. This project implements the core game mechanics like spawning aliens, tracking their positions, and handling player inputs to shoot down invaders.

Project Structure
Modules
alien_spawner:

Responsible for spawning different types of aliens based on the input. It also selects the corresponding alien sprite based on its health.
Internally instantiates memory modules (alien1_memory, alien2_memory, alien3_memory) to handle each alien type's pixel data.
The trajectory_generator is used to control the movement of the aliens across the screen.
trajectory_generator:

Handles the movement (trajectory) of the aliens on the screen.
Moves aliens in predefined paths, controlling their x and y coordinates. It resets or deactivates aliens when they move out of the screen bounds.
alien1_memory, alien2_memory, alien3_memory:

These modules handle the pixel data for different types of aliens. Each type has different sprite images based on its health status.
The sprites are fetched from memory using the alien's health and position.
display_controller:

Handles the rendering of the game on the screen by taking pixel data from the alien memory and player spaceship module.
Ensures proper synchronization for display on a VGA screen.
player_controller:

Manages the player's spaceship, including movement and shooting. It listens for inputs (left, right, shoot) and updates the spaceship's position and firing status.
collision_detector:

Detects collisions between player bullets and aliens. If a bullet hits an alien, it decreases the alien's health or removes it from the screen.
Input/Output
Inputs:

Player controls (buttons for left, right, and shooting).
Alien trajectory controls and spawn signals.
Outputs:

VGA pixel data for rendering the game on a monitor.
Alien and spaceship positions, bullet trajectories.
Game Mechanics
Aliens:

Aliens move across the screen along predefined trajectories based on the trajectory_generator.
The player must shoot down aliens before they reach the bottom of the screen.
Aliens have health points, and their appearance changes as they take damage.
Player:

The player controls a spaceship at the bottom of the screen, capable of moving left and right.
The player can shoot bullets upwards to hit aliens.
A limited number of lives are provided, and the game ends when all lives are lost or if aliens reach the player's position.
Collision Detection:

Bullets fired by the player are checked for collisions with alien sprites using the collision_detector.
Successful hits reduce the alien’s health or remove them if their health reaches zero.
How to Use
Compiling the Project:

Use an FPGA development environment (like Quartus, Vivado, etc.) to compile the Verilog files.
Ensure all modules are included in the project.
Configure pin assignments for inputs (controls) and outputs (VGA).
Uploading to FPGA:

Upload the compiled project bitstream to your FPGA.
Connect a VGA display to view the game.
Connect inputs (buttons or switches) for player controls.
Playing the Game:

Use the left and right controls to move your spaceship.
Press the fire button to shoot at aliens.
Your objective is to shoot down all aliens before they reach the bottom of the screen.
