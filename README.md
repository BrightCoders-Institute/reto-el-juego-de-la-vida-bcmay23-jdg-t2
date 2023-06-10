[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/OKSA7dn9)
![BrightCoders Logo](img/logo.png)

# El juego de la vida.
![Ruby](https://img.shields.io/badge/Ruby-3.2.2-green)
![Rspec](https://img.shields.io/badge/Rspec-green)
![Rubocop](https://img.shields.io/badge/Rubocop-green)

> [Ver instrucciones antes de iniciar](./instructions.md)


## Table of Contents
- Description
- How to Install and Run the Project.
- How to Use the Project.
- Credits
- Badges


## Description. 

Este Desafío de Codificación se trata de calcular la siguiente generación del juego de la vida de Conway, dada cualquier posición inicial.

Comienzas con una cuadrícula bidimensional de células, donde cada célula está viva o muerta. En esta versión del problema, la cuadrícula es finita y ninguna vida puede existir más allá de los bordes. Al calcular la siguiente generación de la cuadrícula, sigue estas reglas:

- Cualquier célula viva con menos de dos vecinos vivos muere, como si fuera por falta de población.
- Cualquier célula viva con más de tres vecinos vivos muere, como si fuera por sobre-población.
- Cualquier célula viva con dos o tres vecinos vivos sobrevive a la siguiente generación.
- Cualquier célula muerta con exactamente tres vecinos vivos se convierte en una célula viva.

Debes escribir un programa que acepte una cuadrícula arbitraria de células y muestre como resultado una cuadrícula similar que muestre la siguiente generación.

[Juego de la Vida: Patrones de ejemplo](http://pi.math.cornell.edu/~lipa/mec/lesson6.html#:~:text=or%20more%20periods.-,Example%20Patterns,-Using%20the%20provided)

## How to Install and Run the Project. ##

1. Clona el repositorio.
2. Accede con la consola a la carpeta del repositorio.
3. Corre el comando **bundle install**

## How to use the project. ##

1. Ejecuta el programa de ruby en la consola. **ruby game-of-life.rb**

## Credits ##

-  ballo1988 rounderjards@gmail.com
-  hugocruz1234 cruzhugo1997@gmail.com
- sr-meh hector.m.rm@hotmail.com
