# <h1 align="center">PONG</h1>

<p align="center">
   <b>A modern, extensible Pong game engine built with PixiJS and TypeScript, featuring advanced physics, real-time multiplayer, and a comprehensive Entity-Component-System architecture.</b><br>
</p>

---

<p align="center">
    <img alt="TypeScript" src="https://img.shields.io/badge/typescript-%23007ACC.svg?style=for-the-badge&logo=typescript&logoColor=white" />
    <img alt="PixiJS" src="https://img.shields.io/badge/PixiJS-FF6C37?style=for-the-badge&logo=pixi.js&logoColor=white" />
    <img alt="WebSocket" src="https://img.shields.io/badge/WebSocket-4F4F4F?style=for-the-badge&logo=socket.io&logoColor=white" />
    <img alt="Node.js" src="https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white" />
</p>
<p align="center">
    <img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/hugomgris/pong?color=lightblue" />
    <img alt="Code language count" src="https://img.shields.io/github/languages/count/hugomgris/pong?color=yellow" />
    <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/hugomgris/pong?color=blue" />
    <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/hugomgris/pong?color=green" />
    <img alt="GitHub stars" src="https://img.shields.io/github/stars/hugomgris/pong?color=gold" />
    <a href="https://linktr.ee/hugomgris"><img src="containers/frontend/static/logos/Linktree-Emblem.png" alt="Check my other works" style="height: 18px;" /></a>
</p>

## Table of Contents

- [Game Overview](#game-overview)
- [Preview](#preview)
- [Quick Start](#quick-start)
- [Game Features](#game-features)
- [Key Technical Features](#key-technical-features)
- [Engine Architecture](#engine-architecture)
- [Postmortem](#postmortem)
- [License](#license)
- [Aknowledgements](#acknowledgments)


---

## Game Overview

This Pong implementation goes far beyond the classic 1972 game, featuring a sophisticated game engine built from the ground up with modern web technologies. The engine implements an Entity-Component-System (ECS) architecture, advanced physics simulation, and supports both local and networked multiplayer gameplay.

## Preview

![Game Menu](img/pong01.png)
![Obstacle spawning](img/pong02.png)
![Wall transformations](img/pong03.png)

## Quick Start

### Prerequisites

- **Node.js 18+**
- **Modern Browser** with WebGL support
- **Docker** (for full stack setup)

### Installation

```bash
# Clone the repository
git clone https://github.com/hugomgris/pong.git
cd pong

# Quick setup (recommended)
make

# Access the game at http://localhost:8080
```

## Key Technical Features
- Custom physics engine with precise collision detection
- Extended mechanics built around an array of different balls, moving walls and power-ups/power-downs
- Real-time multiplayer with client-side prediction and server reconciliation
- Modular ECS architecture for extensible gameplay systems
- Advanced visual effects including particle systems and post-processing
- WebGL-accelerated rendering via PixiJS
- Comprehensive audio system with spatial audio effects using Howler
- Multi-language support, with implemented translations in English, Spanish, French and Catalan

## Game Features

### Core Gameplay
- **Classic Pong**: Traditional paddle-and-ball mechanics with modern physics
- **Multiple Ball Types**: Standard, Burst, Spin, and Multiplying balls with unique behaviors
- **AI Opponent**: Bot opponent available for training
- **Power-up System**: Magnetic paddles, speed boosts, size modifications, and stunning bullets
- **Game Variations**: Classic mode, Enhance mode, online matchmaking (1vs1) and tournament system

### Visual & Audio
- **Particle Systems**: Dynamic particle effects for collisions and special events
- **Post-Processing**: Screen-space effects and shaders (CRT toggleable style)
- **Spatial Audio**: 3D positioned sound effects with Howler.js
- **Responsive Graphics**: Scalable rendering for different screen sizes
- **VFX Library**: Trails, explosions, and environmental effects

### Multiplayer Features
- **Real-time Networking**: WebSocket-based multiplayer low latency
- **Lag Compensation**: Client-side prediction with server authority
- **Cross-Platform**: Play across different browsers

## Engine Architecture

### Entity-Component-System

The game implements a pure ECS architecture for maximum flexibility and performance:

```typescript
// Entity: Container for components
class Entity {
    id: string;
    components: Map<string, Component>;
    layer: string;
}

// Component: Pure data containers
class PhysicsComponent extends Component {
    x: number; y: number;
    velocityX: number; velocityY: number;
    width: number; height: number;
}

// System: Logic processors
class PhysicsSystem implements System {
    update(entities: Entity[], delta: FrameData): void {
        // Process all entities with physics components
    }
}
```

**Core Systems:**
- **Physics System**: Collision detection, movement, and physics simulation
- **Render System**: PixiJS rendering and graphics management
- **Input System**: Keyboard, mouse, and touch input handling
- **VFX System**: Particle effects and visual feedback
- **AI System**: Computer opponent logic and decision making
- **UI System**: User interface rendering, tracking and updating
- **World System**: Wall transformation and obstacle spawning managament
- **Post Processing System**: screen-wide, CRT effect rendering with layered filters

![Game Glossary](img/pong04.png)

## Postmortem

### Project Overview

**Timeline**: ~4 months of development  
**Scope**: Modern Pong recreation with advanced features  
**Team**: Part of a group project done with [Marc Catalán - mcatalan](https://github.com/mcatalan15), [Eva Ferré Mur - eferre-m](https://github.com/eferre-m), and [Nicolas Ponchon - nponchon](https://github.com/mrlouf)  
**Target**: 42 School ft_transcendence final project  
**Goals**: Create a sophisticated game engine demonstrating modern web development and game developement skills

Desde que comenzó el desarrollo, y gracias a que el equipo que formamos para ft_transcendence estaba muy bien organizado, con todos los integrantes encargándose de una parte específica del proyecto sin apenas solapes entre intereses, el impulso general fue buscar todas las oportunidades que daba el *Pong* original para pensar nuevas mecánicas, dinámicas y estéticas. Así, lo más inmediatamente evidente fue que la mítica podía dividirse en unos pocos elementos con los que juguetear: la bola, las palas y los muros. La lista de objetivos salió prácticamente sola y fue creciendo a medida que la imagen final de lo que sería esta versión de Pong iba formándose: diferentes tipos de pelota a base de toquetear las trayectorias, los movimientos y las formas; muros animados que se transformasen en tiempo real y obstáculos que emergiesen desde el fondo de la pantalla; power-ups y power-downs que afectasen la geometría, los controles y las capacidades de las palas, modificando su velocidad, la física de los golpes o incluso dándoles la habilidad de disparar proyectiles. No todo lo que fue brotando en la documentación del desarrollo del proyecto acabó en la versión final, claro —y alguna de las ideas que se quedaron por el camino todavía me duele no haberlas llevado a cabo, como un intento que hubo de hacer que todas las líneas de profundidad y formas de muro estuviesen basadas en ondas, manipulando la fórmula básica de una función sinusoidal—, pero creo que el resultado es satisfactoriamente completo y consigue un recreación razonablemente única del original de 1972.

La dificultad inicial, no obstante, iba más allá del diseño como tal ya que, por las directrices del proyecto general que remata el *Common Core* de 42, lo más urgente era sentarse a aprender TypeScript (en un principio entendí mal el enunciado y pensé que el juego debía hacerse en JavaScript, así que sumémosle que estuve un rato también aprendiendo cómo manejarme en ese lenguaje, aunque bien es cierto que después de JS aprender TS es mucho más sencillo y feliz y saludable), así como ir armando una base de habilidades en torno al desarrollo web, una rama de la programación que hasta este momento no había tocado. Nada grave, pero sí algo que impuso un arranque lento, pausado y necesariamente bien medido, porque la situación también exigía dedicar un rato a estructurar en la medida de lo posible la manera de atacar lo que estaba claro que iba a ser el programa más largo y difícil que había armado hasta entonces. Tras investigar, elegí adentrarme en el mundo del *ECS* (*Entity-Component-System*) para armar el motor, desarrollando un puñado de elementos centrales —Pelota, Pala, Muros, Partículas, etc— que implementasen los componentes que fuesen siendo necesarios a medida que el proyecto avanzaba —Físicas, Animaciones, Interacciones, Renderizaciones, Textos, etc— y fuesen manejados por la red de sistemas que lo mantiene todo en perpetuo movimiento. En menos palabras: estos fueron 4 meses de continuo aprendizaje en todos los frentes, duro y por momentos agotador, pero extremadamente enriquecedor.

En el lado de lo estético, desde los primeros días también quedó grabado a fuego en mi cabeza que quería experimentar con un postprocesado que le diese a toda la experiencia un acabado catódico. En otras ramas de mi trabajo, como la edición de video y audio, los filtros que superponen una pátina analógica son recursos muy habituales para mí, que si bien podría decirse que de un tiempo a esta parte se pueden ver como una suerte de lugar común —culpemos a la nostalgia, al estancamiento estético de un presente tecno-triste que ha perdido identidad a base de apostarlo todo a un triste ideal de optimización que solo devuelve bancarrotas ideológicas, culturales y creativas, o que simplemente *queda bien y resulta vistoso y expresa un mínimo de intención*—, creo que nunca deja de haber margen para la experimentación y la personalización. Lo visual, no obstante, no quería que se quedase en nada más que una superposición resultona, así que había que buscar una manera de conectar los ojos y las manos, el video con el juego, y tras rumiar un poco surgió el ingrediente que lo cuajaría todo: esas líneas de profundidad que hacen crecer el terreno de juego hacia el fondo de la pantalla. En sus primeras iteraciones, el movimiento de estos vectores le daba a la composición una volumetría e infinitud, convirtiendo el plano de juego —el mundo donde viven los muros, las palas y las pelotas— en algo así como un corte constante de ese espacio que las líneas impulsan hacia la pantalla. Algo así como la ilusión de una tomografía, sobre la cual emergió un segundo orden de transformación: las líneas podían retorcerse, transformarse, componerse en diferentes figuras que al llegar al plano de corte pudiesen afectar a los muros. Lo demás fue coger papel y lápiz, tantear geometrías posibles y programar todo un sistema de animación y de generación de colisiones que acabó convirtiéndose, al menos a mi juicio, en la seña de identidad es te Pong reimaginado.

Las figuras de los muros —llamémoslas mundos, apuntemos alto—, atadas siempre a las líneas básicas que constriñen el área de juego en su versión más clásica y prototípica, abrían camino también a una contrapartida flotante, obstáculos desligados de los límites superior e inferior que inyectasen un extra de imprevisibilidad a la trayectoria de la pelota. Todo junto, cada muro hecho de muro y obstáculo, quise componerlo con una cierta entidad propia, dándoles nombre, sugiriendo un cierto camino perpetuo por una vía serpenteante guiada por tótems e ideogramas. Aquí la inspiración directa —al menos dentro de mi cabeza; si lo conseguí o no te lo dejo a ti que estás leyendo esto— fue la larga noche de la carretera subterránea que da nombre a *Kentucky Route Zero*, un juego ocupa un lugar irremplazable en el primer plano de mi cerebro, siempre visible y resonante. De hecho, todo el esfuerzo estético por apelar a lo análogico, a lo catódico, a lo obsoleto y lo vencido tiene su raíz en esta influencia. Las capas de brillos, aberraciones cromáticas, distorsiones lenticulares y líneas de escaneo, todo ese fulgor añejo que viene de otro tiempo —«*El eco de un pasado distante*»— persigue esta estela.



### Cosas que salieron BIEN

#### **Entity-Component-System Architecture**
Ahora que toca echar la vista atrás, creo que la elección del sistema *ECS* fue acertada. Funcionó muy bien para el desarrollo, sobre todo por ser un paradigma absolutamente modular, fácilmente escalable y que permite ir y venir en los diferentes niveles de abstracción funcional que tiene un juego como este para poder añadir nuevas características con facilidad mientras se van puliendo las que ya están implementadas. Esta es, para que nos entendamos, una de las lecciones más valiosas que me llevo de aquí, una estructura que seguro emplearé muchas veces más en el futuro o, directamente, en el presente, ya que la mayoría de motores de videojuego disponibles con libre acces —Unity, Godot, Unreal, ...— fomentan esta manera de entretejer código. 

```typescript
// Adding new features became trivial
class MagneticComponent extends Component { /* just data */ }
class MagneticSystem implements System { /* just logic */ }
```

#### **PixiJS for Rendering**
Durante los primeros días de investigación, y tomada la decisión de hacer un juego 2D por cuestiones compositivas —las restricciones de tiempo y las demasiadas cosas nuevas que aprender no me daban mucho margen para sentir que podría hacer un 3D atractivo—, las dos posibilidades que emergieron para manejar la aplicación gráfica fueron [p5.js](https://p5js.org/) y [PixiJS](https://pixijs.com/). La primera me daba más herramientas para diseñar una interacción entre el juego y el *front-end* —una de esas ideas que ahora pertenecen a caminos no tomados, que habría hecho que los eventos del juego afectasen a la visualización general de la web, cambiando colores, formas, lo que surgiese—, y la segunda una API más potente para componer a base de puro código todo lo que se me ocurriera. Optar por la segunda parece haber sido un acierto, aunque me queda la espinita de esa otra versión que habría difuminado la línea que separa web y aplicación.

#### **Real-time Multiplayer Architecture**
El diseño del multijugador en línea fue una de las tareas más complicadas de todo el proyecto. Programar sockets, coordinar clientes e intentar mantener una sincronización que permita partidas fluidas es, por qué decirlo de otra manera, un poco infernal. Aquí la decisión crucial fue limitar el *matchmaking* a la versión clásica del juego, así como implementar el sistema de torneos exclusivamente en local —un ordenador, dos sillas, ocho participantes—. Con más tiempo habría intentado llevar el juego completo a sus modos *on-line*, pero el calendario le ganó a la ambición.

#### **TypeScript Throughout**
Esto, realmente, vino impuesto por el proyecto, pero me alegra que la orden fuese TypeScript en lugar de JavaScript. Más arriba mencionaba que por no leer bien empecé a programar todo esto en JS, y al hacer el port de lo que había hasta ese momento a JS aprendí que este aguanta *demasiado* sin quejarse. Lo escribo desde la perspectiva de alguien que, como ya he dicho varias veces en este *postmortem*, está aprendiendo varias cosas a la vez, piensa que todo va bien y bajo el capó todo está cogido con cinta adhesiva y gomas de pollo. TypeScript es mucho más exigente a la hora de tipar —obvio, lo sé—, estructurar y asegurarse de que lo que escribes tiene sentido y va a funcionar. Resumiendo: me gusta TypeScript, gracias por tanto.

#### **Modular Visual Effects**
Los efectos quedaron, en pocas palabras, bien. El efecto CRT cumplió de sobras mis expectativas, si bien está bastante apoyado en los filtros de PixiJS, un módulo d extensión que puede añadirse al núcleo de la API. Lo ideal habría sido programar mis propios *shaders*, pero llega un punto en el que uno se siente como la cita de Carl Sagan que dice que para hacer una tarta de manzana primero uno tiene que inventar el universo. En un proyecto posterior, SCOP, me metí de lleno en la programación de *shaders*, así que aquí no hay espinita clavada. Todo bien, todo correcto.

![Gameplay](img/pong05.png)

### Cosas que podrían haber salido MEJOR

#### **Physics System Complexity**
El sistema de físicas es un poco laberíntico. Funcionan, se adaptan bien a todos los cambios que van ocurriendo en el campo de juego —a veces el choque entre una bola curva y un muro en movimiento provoca comportamientos extraños, pero ocurre poco, casi nunca, no habría ni que mencionarlo de hecho, no sé por qué lo hago— y son el resultado de un combate largo y complicado, pero coon más tiempo —otra vez, siempre— habrían sido objeto de una refactorización masiva. Seguro que en el futuro, cuando vuelva a este proyecto, me arrancaré los pelos de la cabeza —si me quedan, que espero que sí—, pero a día de hoy estoy orgulloso de la funcionalidad. Supongo que eso cuenta para algo.

```typescript
// This became unwieldy with edge cases
private handleBallPaddleCollision(ball: Ball, paddle: Paddle): void {
    // 200+ lines of collision logic with numerous special cases
}
```

#### **ECS Over-Engineering**
Quizá la estructura ECS fue demasiado para un *Pong* que podría haberse hecho con un paradigma más sencillo y centrado en clases —un POO de manual, en esencia—, pero no tengo muy claro si todas las cosas que acabaron implementadas en la versión final del código se me habrían descontrolado sin el ECS. Nunca lo sabremos, y nada de esto quita que gracias a utilizar este paradigma me llevo una cosa más en la mochila después de estos meses de trabajo.

#### **Network State Synchronization**
El sistema multijugador online necesitaba más tiempo del que le di, pero esto es algo que sé ahora, tras pegarme contra el muro. La próxima vez solo tendré que mirar la cicatriz que los *websockets* me dejaron para no repetir este error.


#### **Audio System Late Integration**
La capa de audio cumple y fue otra de esas implementaciones de la que aprendí mucho, pero podría haberla planificado mejor para coserla mejor a la capa de juego. Otra cosa que anotar para proyectos futuros.

#### **Interactive Menu & Input Gathering**
Construir el menu y toda su funcionalidad dentro de la aplicación de PixiJS fue, a toas las luces, una mala decisión. Después de mucho trabajo e iteración el resultado fue completamente funcional, pero leer inputs de usuario y comunicar con la base de datos via API para actualizar información en pantalla —lo que quiere decir: redibujar— es muy poco efectivo. Si hay una cosa que tengo clara ahora que el proyecto ha acabado es que si volviera a hacerlo pondría el menú directamente en el *font-end*, escribiría los archivos de configuración para el juego desde fuera y lanzaría la aplicación una vez las directrices están recogidas. Esta es otra de esos agujeros en los que hay que caer para aprender a evitar.

### Lessons

#### **Game Engine Architecture**
- Understanding of ECS patterns and when to use them
- Importance of separation between simulation and presentation layers
- How to structure game loops for consistent performance

#### **Real-time Networking**
- Client-side prediction and server reconciliation techniques
- WebSocket optimization for low-latency communication
- Handling network edge cases and connection recovery

#### **Game Physics Programming**
- Collision detection algorithms (broad-phase and narrow-phase)
- Continuous collision detection to prevent tunneling
- Force-based physics systems and constraint solving

#### **Web Performance Optimization**
- Browser-specific rendering optimizations
- Memory management in JavaScript/TypeScript
- Profiling and optimization techniques for 60fps gameplay

#### **Full-Stack Development**
- Microservices architecture with Docker
- Database design for real-time applications
- Authentication and security in web applications

### Things I'd add if I had the time to do so

A parte de añadir más figuras, trastear con más tipos de pelota e inventar algún que otro *power-up* adicional, de entre los sistemas implementados al que le dedicaría más tiempo sería sin duda el de la IA. La versión actual del juego tiene un bot que cumple pero no tiene demasiado en cuenta toda esa capa cambiante superpuesta al núcleo del *Pong* original. En modo clásico es un oponente prácticamente imbatible por la tasa de refresco con la que lee la trayectoria de la pelota —cada segundo, impuesto por el enunciado del proyecto—, y en modo normal no tiene en consideración las posiciones de los objetos, las configuraciones de los muros, los movimientos de los obstáculos, etc. Aquí podría repetir por enésima vez lo de que no hubo tiempo, pero en el fondo desarrollar una IA de este calibre escapaba, creo, a los límites de este trabajo y habría supuesto al menos un mes más de trabajo para poder tenerla a punto, pulida y con suficientes opciones para su configuración como para que tuviese sentido un despliegue así. Ojalá tenga oportunidad pronto de sentarme a escribir una IA compleja en algún otro proyecto que pase por mi mesa.

En modo ilusión total —enajenado—, un modo cooperativo y un modo rítmico-músical creo que funcionarían bien como derivados de la arquitectura jugable de *Pong*. En mi libreta hay ideas escritas en estas líneas, pero si lo de la IA escapaba al contexto de trabajo estos extras ya existen directamente en otra dimensión, a mil millones de años luz. Creo que aquí lo que brota es una fricción entre el deseo de hacer cosas, de diseñar juegos, con el tiempo que ello lleva y los ritmos de aprenizaje que cada proceso trae consigo. Ese es el camino desde aquí y hacia adelante, supongo: ir haciendo para poder hacer.

Una refactorización general tampoco iría mal, porque las miles de líneas de código que tiene este juego estoy convencido de que podrían reducirse mucho a base de reconstruirlas con algo más de cabeza y conocimiento. Tendrá que bastar con hacer lo próximo mejor.


### Final Reflection

This project was an incredible learning experience in modern web game development. While some architectural decisions were overly complex for the scope, they provided valuable insights into scalable game engine design. The combination of TypeScript, PixiJS, and WebSocket technologies created a robust foundation that could easily be extended into a more complex game.

The most rewarding aspect was seeing all the systems work together seamlessly - from the ECS entity management to real-time networking to visual effects. Despite the challenges, the final product demonstrates sophisticated game development techniques that go far beyond a simple Pong recreation. Or so I would hope.

### Optimization Features

- **Browser-specific Settings**: Firefox and Chrome optimizations
- **Connection Pooling**: Efficient database connections
- **Caching Strategy**: Redis-based session and game state caching
- **Asset Optimization**: Compressed textures and audio files

## License

This project is part of the 42 School curriculum. Educational use only.

## Acknowledgments

- **42 School** for the comprehensive curriculum and project framework
- **The Pong Legacy** - Allan Alcorn's original 1972 creation
- **Open Source Community**:
  - **PixiJS** for high-performance 2D rendering
  - **Fastify** for lightweight and fast server framework
  - **Socket.io** for real-time communication
  - **Docker** for containerization platform
  - **Redis** for in-memory data structure store
  - **TailwindCSS** for utility-first CSS framework
