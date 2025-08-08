# Pattern Finder
Currently work in progress

## How to Develope
### Install Addons on addons/ Folder
```
addons/
├── godot_ui_animations
├── proton_scatter
│   ├── demos
│   ├── icons
│   │   ├── loading
│   │   └── types
│   ├── masks
│   ├── presets
│   ├── src
│   │   ├── cache
│   │   │   └── inspector_plugin
│   │   ├── common
│   │   ├── documentation
│   │   │   └── pages
│   │   ├── modifiers
│   │   │   └── compute_shaders
│   │   ├── particles
│   │   ├── presets
│   │   ├── shapes
│   │   │   └── gizmos_plugin
│   │   │       ├── components
│   │   │       └── icons
│   │   └── stack
│   │       └── inspector_plugin
│   │           └── ui
│   │               ├── modifier
│   │               │   └── components
│   │               │       └── header
│   │               ├── modifier_list_popup
│   │               └── presets
│   └── tests
└── rope3d
```

### Put Assets on arts/ Folder
```
arts/
├── 2D
│   ├── UI
│   │   ├── kenney_fantasy-ui-borders
│   │   │   ├── PNG
│   │   │   │   ├── Default
│   │   │   │   │   ├── Border
│   │   │   │   │   ├── Divider
│   │   │   │   │   ├── Divider Fade
│   │   │   │   │   ├── Panel
│   │   │   │   │   ├── Transparent border
│   │   │   │   │   └── Transparent center
│   │   │   │   └── Double
│   │   │   │       ├── Border
│   │   │   │       ├── Divider
│   │   │   │       ├── Divider Fade
│   │   │   │       ├── Panel
│   │   │   │       ├── Transparent border
│   │   │   │       └── Transparent center
│   │   │   └── Vector
│   │   ├── kenney_input-prompts-pixel-16
│   │   │   ├── Tilemap
│   │   │   └── Tiles
│   │   └── kenney_ui-pack-space-expansion
│   │       ├── Font
│   │       ├── PNG
│   │       │   ├── Blue
│   │       │   │   ├── Default
│   │       │   │   └── Double
│   │       │   ├── Extra
│   │       │   │   ├── Default
│   │       │   │   └── Double
│   │       │   ├── Green
│   │       │   │   ├── Default
│   │       │   │   └── Double
│   │       │   ├── Grey
│   │       │   │   ├── Default
│   │       │   │   └── Double
│   │       │   ├── Red
│   │       │   │   ├── Default
│   │       │   │   └── Double
│   │       │   └── Yellow
│   │       │       ├── Default
│   │       │       └── Double
│   │       └── Vector
│   │           ├── Blue
│   │           ├── Extra
│   │           ├── Green
│   │           ├── Grey
│   │           ├── Red
│   │           └── Yellow
│   ├── pictures
│   │   ├── Cavendish-walk
│   │   ├── jeremy-perkins-uhjiu8FjnsQ-unsplash
│   │   ├── kenney_emotes-pack
│   │   │   ├── PNG
│   │   │   │   ├── Pixel
│   │   │   │   │   ├── Style 1
│   │   │   │   │   ├── Style 2
│   │   │   │   │   ├── Style 3
│   │   │   │   │   ├── Style 4
│   │   │   │   │   ├── Style 5
│   │   │   │   │   ├── Style 6
│   │   │   │   │   ├── Style 7
│   │   │   │   │   └── Style 8
│   │   │   │   └── Vector
│   │   │   │       ├── Style 1
│   │   │   │       ├── Style 2
│   │   │   │       ├── Style 3
│   │   │   │       ├── Style 4
│   │   │   │       ├── Style 5
│   │   │   │       ├── Style 6
│   │   │   │       ├── Style 7
│   │   │   │       └── Style 8
│   │   │   ├── Spritesheets
│   │   │   ├── Tilesheets
│   │   │   └── Vector
│   │   ├── kenney_generic-items
│   │   │   ├── PNG
│   │   │   │   ├── Colored
│   │   │   │   └── White
│   │   │   ├── Spritesheet
│   │   │   └── Vector
│   │   └── kenney_particle-pack
│   │       ├── PNG (Black background)
│   │       │   └── Rotated
│   │       ├── PNG (Transparent)
│   │       │   └── Rotated
│   │       └── Unity samples
│   └── textures
├── 3D
│   ├── animations
│   │   └── Universal Animation Library[Standard]
│   │       └── Animation Library[Standard]
│   │           ├── Godot
│   │           ├── Unity
│   │           └── Unreal Engine
│   └── models
│       ├── -KIxYNmS
│       │   └── textures
│       ├── 7iHxTxSC
│       │   └── textures
│       ├── 9J43rgZz
│       │   └── textures
│       ├── Modular Sci Fi Guns - Nov 2021-20250213T135710Z-001
│       │   └── Modular Sci Fi Guns - Nov 2021
│       │       ├── Guns
│       │       │   ├── Blends
│       │       │   ├── FBX
│       │       │   ├── OBJ
│       │       │   └── glTF
│       │       └── Modular Parts
│       │           ├── Blends
│       │           ├── FBX
│       │           ├── OBJ
│       │           └── glTF
│       ├── Modular SciFi MegaKit[Standard]
│       │   ├── FBX
│       │   │   ├── Aliens
│       │   │   ├── Columns
│       │   │   ├── Decals
│       │   │   ├── Platforms
│       │   │   ├── Props
│       │   │   └── Walls
│       │   ├── FBX (Unity)
│       │   │   ├── Aliens
│       │   │   ├── Columns
│       │   │   ├── Decals
│       │   │   ├── Platforms
│       │   │   ├── Props
│       │   │   └── Walls
│       │   ├── OBJ
│       │   │   ├── Aliens
│       │   │   ├── Columns
│       │   │   ├── Decals
│       │   │   ├── Platforms
│       │   │   ├── Props
│       │   │   └── Walls
│       │   ├── Textures
│       │   └── glTF
│       │       ├── Aliens
│       │       ├── Columns
│       │       ├── Decals
│       │       ├── Platforms
│       │       ├── Props
│       │       └── Walls
│       ├── Napoleon.stl
│       │   └── __MACOSX
│       ├── Sci-Fi Essentials Kit[Standard]
│       │   ├── FBX
│       │   ├── FBX (Unity)
│       │   ├── OBJ
│       │   ├── Textures
│       │   └── glTF
│       ├── Styloorobotcharacte fbx and gltfr
│       │   ├── FBXrobot
│       │   │   └── textures
│       │   └── GLTFrobot
│       ├── Train Pack - April 2019-20250408T152135Z-001
│       │   └── Train Pack - April 2019
│       │       ├── Blends
│       │       ├── FBX
│       │       └── OBJ
│       ├── Ultimate Modular Men- Feb 2022-20250427T162241Z-001
│       │   └── Ultimate Modular Men- Feb 2022
│       │       ├── All together
│       │       │   ├── Blends
│       │       │   └── FBX
│       │       ├── Humanoid Rig
│       │       │   ├── All Together
│       │       │   └── Individual Characters
│       │       │       ├── Blend
│       │       │       └── FBX
│       │       ├── Individual Characters
│       │       │   ├── Blends
│       │       │   ├── FBX
│       │       │   └── glTF
│       │       └── Separate Skeletal Meshes and Animations
│       │           ├── Adventurer
│       │           ├── Beach
│       │           ├── Casual_2
│       │           ├── Casual_Hoodie
│       │           ├── Farmer
│       │           ├── Horse
│       │           ├── King
│       │           ├── Punk
│       │           ├── SpaceSuit
│       │           ├── Suit
│       │           ├── Swat
│       │           ├── Weapons
│       │           └── Worker
│       ├── ZamdZxf7
│       │   └── textures
│       ├── eAsdW74t
│       │   └── textures
│       ├── sledgehammer_01_2k.gltf
│       │   └── textures
│       └── ym-7Wa4Z
│           └── textures
└── audio
    ├── musics
    └── sounds
        ├── kenney_digital-audio
        │   └── Audio
        ├── kenney_rpg-audio
        │   └── Audio
        ├── kenney_sci-fi-sounds
        │   └── Audio
        └── kenney_ui-audio
            └── Audio
```
