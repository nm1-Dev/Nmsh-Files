
# grw-drones - Drones for QB Core Servers as Item

### What is this?

* This is a script for Drones that can used as an item for QB Core Framework.
* You can buy this item from any shop and use as regular item.

### Features
- Use Drones as regular item and add it to your shops to improve RP experience.
- Control your drone with easy.
- Give various abilities to drone such as Explosive, Tazing, Night vision and Thermal vision
- 360 rotatable inbuilt camera.
- x16 zoom capability
- Auto come to Home feature for easy landing.
- It's synced everyone will see your actions and drone.
- Fully configurable
- Can limit to Emergence and LEO services
- Custom addon drone added to script it self.

**Synced and improved animations and props**
![Synced and improved animations and props](https://i.imgur.com/Iqslh7c.png)
**Can use as a item in inventory**
![Can use as an item](https://i.imgur.com/igg2t6c.png)

**Inbuilt camera**
![Inbuilt camera](https://i.imgur.com/iRaNTAi.png)

**Auto return to home**
![Inbuilt camera](https://i.imgur.com/qZb6UFV.png)

## Dependency
meta_libs - https://github.com/meta-hub/meta_libs

## Download & Installation

### Using Git
```
cd resources
git clone https://github.com/sandunisuru/grw-drones
```

### Manually
- Download from this.

## Installation
- Add this to your `server.cfg`:

```
ensure grw-drones
```
- Add `drone.png` to your `qb-inventory/client/html/images ` folder
- Copy and Paste this to your `qb-core/shared.lua` file
 ```
["drone"] = {["name"] = "drone", ["label"] = "Police Drone", ["weight"] = 8000, ["type"] = "item", ["image"] = "drone.png", ["unique"] = true, ["useable"] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Playable RC Toy Car with embedded Camera"}
 ```
 - Enjoy :D
