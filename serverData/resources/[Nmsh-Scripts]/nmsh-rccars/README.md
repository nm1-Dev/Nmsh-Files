
# grw-rccars - RC Cars for QB Core Servers as Item
This script is mainly based on **[qalle_rccars](https://github.com/qalle-git/qalle_rccars)** by [qalle-git](https://github.com/qalle-git)
### What is this?

* This is a script for Toy Remote Controlled Cars for QB Core Framework.
* You can buy this item from any shop and use as regular item.

### Features
- Use RC car as regular item and add it to your shops to improve RP experience.
- You will now be able to drive your own RCCar.
- You steer it with UP, DOWN, LEFT, RIGHT -> Arrows.
- It's synced everyone will see your tablet and rccar.

**Control with arrow keys**
![RC Car with Remotes](https://i.imgur.com/gRG26vb.png)

**Can use as a item in inventory**
![Can use as an item](https://i.imgur.com/Rx1Iw5l.png)

**Inbuilt camera**
![enter image description here](https://i.imgur.com/UAinGVL.png)

## Download & Installation

### Using Git
```
cd resources
git clone https://github.com/sandunisuru/grw-rccars
```

### Manually
- Download from this.

## Installation
- Add this to your `server.cfg`:

```
ensure grw-rccars
```
- Add `rccar.png` to your `qb-inventory/client/html/images ` folder
- Copy and Paste this to your `qb-core/shared.lua` file

 ```
 ["rccar"] = {["name"] = "rccar", ["label"] = "RC Car", ["weight"] = 8000, ["type"] = "item", ["image"] = "rccar.png", ["unique"] = true, ["useable"] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Playable RC Toy Car with embedded Camera"}
 ```
 - Enjoy :D
