![Pattern Finder](title.png?raw=true "Title")
Currently work in progress

# How to Develope
## Install Addons on addons/ Folder and Put Assets on arts/ Folder
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
arts/
├── 2D
│   ├── UI
│   │   ├── itch.io
│   │   │   └── IconGodotNode
│   │   │       ├── color
│   │   │       ├── control
│   │   │       ├── node
│   │   │       ├── node_2D
│   │   │       └── node_3D
│   │   └── kenney.nl
│   │       ├── kenney_fantasy-ui-borders
│   │       │   ├── PNG
│   │       │   │   ├── Default
│   │       │   │   │   ├── Border
│   │       │   │   │   ├── Divider
│   │       │   │   │   ├── Divider Fade
│   │       │   │   │   ├── Panel
│   │       │   │   │   ├── Transparent border
│   │       │   │   │   └── Transparent center
│   │       │   │   └── Double
│   │       │   │       ├── Border
│   │       │   │       ├── Divider
│   │       │   │       ├── Divider Fade
│   │       │   │       ├── Panel
│   │       │   │       ├── Transparent border
│   │       │   │       └── Transparent center
│   │       │   └── Vector
│   │       ├── kenney_input-prompts-pixel-16
│   │       │   ├── Tilemap
│   │       │   └── Tiles
│   │       └── kenney_ui-pack-space-expansion
│   │           ├── Font
│   │           ├── PNG
│   │           │   ├── Blue
│   │           │   │   ├── Default
│   │           │   │   └── Double
│   │           │   ├── Extra
│   │           │   │   ├── Default
│   │           │   │   └── Double
│   │           │   ├── Green
│   │           │   │   ├── Default
│   │           │   │   └── Double
│   │           │   ├── Grey
│   │           │   │   ├── Default
│   │           │   │   └── Double
│   │           │   ├── Red
│   │           │   │   ├── Default
│   │           │   │   └── Double
│   │           │   └── Yellow
│   │           │       ├── Default
│   │           │       └── Double
│   │           └── Vector
│   │               ├── Blue
│   │               ├── Extra
│   │               ├── Green
│   │               ├── Grey
│   │               ├── Red
│   │               └── Yellow
│   ├── pictures
│   │   ├── Cavendish-walk
│   │   ├── jeremy-perkins-uhjiu8FjnsQ-unsplash
│   │   └── kenney.nl
│   │       ├── kenney_emotes-pack
│   │       │   ├── PNG
│   │       │   │   ├── Pixel
│   │       │   │   │   ├── Style 1
│   │       │   │   │   ├── Style 2
│   │       │   │   │   ├── Style 3
│   │       │   │   │   ├── Style 4
│   │       │   │   │   ├── Style 5
│   │       │   │   │   ├── Style 6
│   │       │   │   │   ├── Style 7
│   │       │   │   │   └── Style 8
│   │       │   │   └── Vector
│   │       │   │       ├── Style 1
│   │       │   │       ├── Style 2
│   │       │   │       ├── Style 3
│   │       │   │       ├── Style 4
│   │       │   │       ├── Style 5
│   │       │   │       ├── Style 6
│   │       │   │       ├── Style 7
│   │       │   │       └── Style 8
│   │       │   ├── Spritesheets
│   │       │   ├── Tilesheets
│   │       │   └── Vector
│   │       ├── kenney_generic-items
│   │       │   ├── PNG
│   │       │   │   ├── Colored
│   │       │   │   └── White
│   │       │   ├── Spritesheet
│   │       │   └── Vector
│   │       ├── kenney_particle-pack
│   │       │   ├── PNG (Black background)
│   │       │   │   └── Rotated
│   │       │   ├── PNG (Transparent)
│   │       │   │   └── Rotated
│   │       │   └── Unity samples
│   │       └── kenney_planets
│   │           ├── Parts
│   │           └── Planets
│   └── textures
│       ├── 3dtextures.me
│       │   └── Sci-fi_Metal_Walkway_001_SD-20250926T172603Z-1-001
│       │       └── Sci-fi_Metal_Walkway_001_SD
│       └── polyhaven
│           ├── fine_grained_wood_1k.gltf
│           │   └── textures
│           └── rusty_metal_sheet_1k.gltf
│               └── textures
├── 3D
│   ├── animations
│   │   └── Universal Animation Library[Standard]
│   │       └── Animation Library[Standard]
│   │           ├── Godot
│   │           ├── Unity
│   │           └── Unreal Engine
│   └── models
│       ├── Sketchfab
│       │   ├── 1903_wright_flyer
│       │   ├── 1964.88_armor_for_man_and_horse
│       │   ├── halite_crystals
│       │   └── triceratops_horridus_marsh
│       ├── ambientcg
│       │   └── 3DLemon001_HQ-4K-PNG
│       ├── blendswap
│       │   └── 11-common-household-items
│       ├── itch.io
│       │   ├── CityEnvPack1
│       │   │   ├── AC_Unit_OutDoor
│       │   │   ├── ATM
│       │   │   ├── CityMailBox
│       │   │   ├── ConcreteRoadblock
│       │   │   ├── Dumpster
│       │   │   ├── Payphone
│       │   │   ├── Rooftop_Watertower
│       │   │   ├── SecurityCamera
│       │   │   ├── StreetBench
│       │   │   ├── StreetLight
│       │   │   └── Traffic_Cone
│       │   ├── CityEnviroinmentPack2
│       │   │   ├── Bus_Stop
│       │   │   ├── Mailbox
│       │   │   ├── Outdoor_Chair
│       │   │   ├── Outdoor_Table
│       │   │   ├── Parking_Meter
│       │   │   ├── Plastic_Trash_Bin
│       │   │   ├── Portaloo
│       │   │   ├── Realistic Electrical Box
│       │   │   └── Roadblock02
│       │   ├── Food&DrinksPack
│       │   │   ├── Canned_Food
│       │   │   │   └── tex
│       │   │   ├── Canned_Tuna
│       │   │   ├── CoffeeCup
│       │   │   ├── FrozenPizza
│       │   │   ├── Hamburger
│       │   │   ├── HotDog
│       │   │   ├── IceCream
│       │   │   ├── Milk
│       │   │   ├── Pizza
│       │   │   └── Sushi
│       │   ├── Gadgets&Electronics
│       │   │   ├── Console
│       │   │   ├── Digital_Camera
│       │   │   ├── Flashlight
│       │   │   ├── Microphone
│       │   │   ├── Radio
│       │   │   ├── Router
│       │   │   ├── SecurityCamera
│       │   │   ├── USB_Stick
│       │   │   ├── VR_Goggles
│       │   │   └── WalkieTalkie
│       │   ├── Guns&Explosives
│       │   │   ├── AK-47
│       │   │   ├── AT_MINE
│       │   │   ├── C4
│       │   │   ├── Claymore
│       │   │   ├── Flare_Gun
│       │   │   ├── Flashbang
│       │   │   ├── FragGrenade
│       │   │   ├── GreaseGun
│       │   │   ├── Luger
│       │   │   ├── M24_Grenade
│       │   │   ├── M4A1
│       │   │   ├── Molotv_Cocktail
│       │   │   ├── Nuclear_Bomb
│       │   │   ├── Pipe_Bomb
│       │   │   ├── Pistol_MK
│       │   │   ├── Shotgun
│       │   │   ├── Smoke_Grenade
│       │   │   ├── Sniper
│       │   │   └── Suomi_KP
│       │   ├── IndustrialPack
│       │   │   ├── CableDrum
│       │   │   ├── Car_Jack
│       │   │   ├── ElectricalBox
│       │   │   ├── ElectricalBox02
│       │   │   ├── ExplosiveBarrel
│       │   │   ├── Gas_Cylinder
│       │   │   ├── Gas_can
│       │   │   ├── PalletTruck
│       │   │   ├── Platform_Trolley
│       │   │   ├── Water_Barrel
│       │   │   ├── WorkLight
│       │   │   └── Worklight02
│       │   ├── IndustrialPack2
│       │   │   ├── CautionSign_WetFloor
│       │   │   ├── Cement_Mixer
│       │   │   ├── Fire_Extinguisher
│       │   │   ├── Generator
│       │   │   ├── Locker
│       │   │   ├── Motor_Oil
│       │   │   ├── SolarpanelSetup
│       │   │   ├── SprayCan
│       │   │   └── Wood_Pallet
│       │   ├── MedievalPropsPack
│       │   │   ├── Cannon
│       │   │   ├── Crossbow
│       │   │   ├── Gallows
│       │   │   ├── Guillotine
│       │   │   ├── MarketStall
│       │   │   ├── MedievalBeerMug
│       │   │   ├── Medieval_Goblet
│       │   │   ├── SackOfGrain
│       │   │   ├── Scroll
│       │   │   └── SkeletonKey
│       │   ├── MeleeWeaponsPack
│       │   │   └── MeleeWeaponsPack#1
│       │   │       ├── Combat_Knife
│       │   │       ├── Crowbar
│       │   │       ├── Dagger
│       │   │       ├── FireAxe
│       │   │       ├── Hammer
│       │   │       ├── Katana
│       │   │       ├── KitchenKnife
│       │   │       ├── Kunai
│       │   │       ├── Machete
│       │   │       ├── MedievalMace
│       │   │       ├── MedievalWarhammer
│       │   │       ├── NailBat
│       │   │       ├── PoliceBaton
│       │   │       ├── Rusty_pipe
│       │   │       ├── Sledgehammer
│       │   │       ├── Spade
│       │   │       ├── Spear
│       │   │       ├── TireIron
│       │   │       ├── Tomahawk
│       │   │       ├── Tomahawk_Modern
│       │   │       └── TwoHandedAxe
│       │   ├── ScifiProps
│       │   │   ├── Control_Panel
│       │   │   ├── ScifiBarrel
│       │   │   ├── ScifiContainer
│       │   │   ├── ScifiGenerator
│       │   │   ├── Scifi_Bench
│       │   │   ├── Scifi_Chair
│       │   │   ├── Scifi_Chamber
│       │   │   ├── Scifi_Lamp
│       │   │   └── Scifi_Locker
│       │   └── Styloorobotcharacte fbx and gltfr
│       │       ├── FBXrobot
│       │       │   └── textures
│       │       └── GLTFrobot
│       ├── kenney.nl
│       │   └── kenney_food-kit
│       │       ├── Models
│       │       │   ├── FBX format
│       │       │   │   └── Textures
│       │       │   ├── GLB format
│       │       │   │   └── Textures
│       │       │   ├── OBJ format
│       │       │   │   └── Textures
│       │       │   └── Textures
│       │       └── Previews
│       ├── original
│       ├── polyhaven
│       │   ├── -KIxYNmS
│       │   │   └── textures
│       │   ├── 7iHxTxSC
│       │   │   └── textures
│       │   ├── 9J43rgZz
│       │   │   └── textures
│       │   ├── ZamdZxf7
│       │   │   └── textures
│       │   ├── eAsdW74t
│       │   │   └── textures
│       │   ├── sand_rocks_small_01_2k.gltf
│       │   │   └── textures
│       │   ├── sledgehammer_01_2k.gltf
│       │   │   └── textures
│       │   └── ym-7Wa4Z
│       │       └── textures
│       ├── quaternius
│       │   ├── Alien Animated - April 2019-20250908T163850Z-1-001
│       │   │   └── Alien Animated - April 2019
│       │   │       ├── Blends
│       │   │       ├── FBX
│       │   │       └── OBJ
│       │   ├── Animated Mech Pack - March 2021-20250908T163901Z-1-001
│       │   │   └── Animated Mech Pack - March 2021
│       │   │       ├── Flat Colors
│       │   │       │   ├── Blends
│       │   │       │   │   └── textures
│       │   │       │   ├── FBX
│       │   │       │   ├── OBJ
│       │   │       │   └── glTF
│       │   │       └── Textured
│       │   │           ├── Blends
│       │   │           │   └── textures
│       │   │           ├── FBX
│       │   │           ├── OBJ
│       │   │           ├── Textures
│       │   │           │   └── Color Variations
│       │   │           └── glTF
│       │   ├── Animated Monster Pack by @Quaternius-20250908T163628Z-1-001
│       │   │   └── Animated Monster Pack by @Quaternius
│       │   │       ├── Blend
│       │   │       ├── FBX
│       │   │       └── OBJ
│       │   ├── Modular Sci Fi Guns - Nov 2021-20250213T135710Z-001
│       │   │   └── Modular Sci Fi Guns - Nov 2021
│       │   │       ├── Guns
│       │   │       │   ├── Blends
│       │   │       │   ├── FBX
│       │   │       │   ├── OBJ
│       │   │       │   └── glTF
│       │   │       └── Modular Parts
│       │   │           ├── Blends
│       │   │           ├── FBX
│       │   │           ├── OBJ
│       │   │           └── glTF
│       │   ├── Modular SciFi MegaKit[Standard]
│       │   │   ├── FBX
│       │   │   │   ├── Aliens
│       │   │   │   ├── Columns
│       │   │   │   ├── Decals
│       │   │   │   ├── Platforms
│       │   │   │   ├── Props
│       │   │   │   └── Walls
│       │   │   ├── FBX (Unity)
│       │   │   │   ├── Aliens
│       │   │   │   ├── Columns
│       │   │   │   ├── Decals
│       │   │   │   ├── Platforms
│       │   │   │   ├── Props
│       │   │   │   └── Walls
│       │   │   ├── OBJ
│       │   │   │   ├── Aliens
│       │   │   │   ├── Columns
│       │   │   │   ├── Decals
│       │   │   │   ├── Platforms
│       │   │   │   ├── Props
│       │   │   │   └── Walls
│       │   │   ├── Textures
│       │   │   └── glTF
│       │   │       ├── Aliens
│       │   │       ├── Columns
│       │   │       ├── Decals
│       │   │       ├── Platforms
│       │   │       ├── Props
│       │   │       └── Walls
│       │   ├── Sci-Fi Essentials Kit[Standard]
│       │   │   ├── FBX
│       │   │   ├── FBX (Unity)
│       │   │   ├── OBJ
│       │   │   ├── Textures
│       │   │   └── glTF
│       │   ├── Train Pack - April 2019-20250408T152135Z-001
│       │   │   └── Train Pack - April 2019
│       │   │       ├── Blends
│       │   │       ├── FBX
│       │   │       └── OBJ
│       │   └── Ultimate Modular Men- Feb 2022-20250427T162241Z-001
│       │       └── Ultimate Modular Men- Feb 2022
│       │           ├── All together
│       │           │   ├── Blends
│       │           │   └── FBX
│       │           ├── Humanoid Rig
│       │           │   ├── All Together
│       │           │   └── Individual Characters
│       │           │       ├── Blend
│       │           │       └── FBX
│       │           ├── Individual Characters
│       │           │   ├── Blends
│       │           │   ├── FBX
│       │           │   └── glTF
│       │           └── Separate Skeletal Meshes and Animations
│       │               ├── Adventurer
│       │               ├── Beach
│       │               ├── Casual_2
│       │               ├── Casual_Hoodie
│       │               ├── Farmer
│       │               ├── Horse
│       │               ├── King
│       │               ├── Punk
│       │               ├── SpaceSuit
│       │               ├── Suit
│       │               ├── Swat
│       │               ├── Weapons
│       │               └── Worker
│       ├── sharetextures
│       │   ├── 3D_lemon_1
│       │   │   └── textures
│       │   └── 3D_scales_1
│       │       └── textures
│       └── threedscans
│           └── Napoleon.stl
│               └── __MACOSX
└── audio
	├── musics
	│   └── originals
	│       └── hydrogen
	├── recordings
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
