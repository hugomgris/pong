# <h1 align="center">PONG</h1>

<p align="center">
   <b>A modern, extensible Pong game engine built with PixiJS and TypeScript, featuring advanced physics, extended mechanics, real-time multiplayer, and a comprehensive Entity-Component-System architecture.</b><br>
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

WIP

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
