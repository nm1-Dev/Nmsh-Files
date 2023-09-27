![Cigar_Job_1-01](https://github.com/abdullasadi/kael-cigar/assets/17822126/d26ee07c-5d6d-4008-afef-ae29c8d37cca)

### FiveM Custom Cigar Job By Kael Team

## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/qbcore-framework/qb-target)
- [qb-menu](https://github.com/qbcore-framework/qb-menu)

## Preview
- [Youtube](https://youtu.be/3Ju_5gzQi4w)

## INSTALL

Add the item images to your inventory script

-	[qb] > qb-inventory > html > images

    
## QBShared Items

[qb] > qb-core > shared > items.lua

```
    --kael-ciger
    ['tobacco_leaf'] 		 		= {['name'] = 'tobacco_leaf',       		    ['label'] = 'Tobacco Leaf',	 		   ['weight'] = 100, 		  ['type'] = 'item', 		 ['image'] = 'tobacco_leaf.png', 			['unique'] = false, 	    ['useable'] = false, 	['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Leaf'},
    ['crolling_paper']              = {['name'] = 'crolling_paper',                 ['label'] = 'Rolling Paper',           ['weight'] = 0,            ['type'] = 'item',         ['image'] = 'rolling_paper.png',           ['unique'] = false,         ['useable'] = false,    ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = ''},
    ['cubancigar']                  = {['name'] = 'cubancigar',                     ['label'] = 'Cuban Cigar',             ['weight'] = 0,            ['type'] = 'item',         ['image'] = 'cubancigar.png',              ['unique'] = false,         ['useable'] = true,    ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = ''},
    ['amoniagas']                   = {['name'] = 'amoniagas',                      ['label'] = 'Amonia Gas',              ['weight'] = 0,            ['type'] = 'item',         ['image'] = 'amoniagas.png',              ['unique'] = false,         ['useable'] = false,    ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = ''},
    ['morecigar']                   = {['name'] = 'morecigar',                      ['label'] = 'More Cigar',              ['weight'] = 0,            ['type'] = 'item',         ['image'] = 'morecigar.png',              ['unique'] = false,         ['useable'] = true,    ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = ''},
    ['cubanbox']                   = {['name'] = 'cubanbox',                      ['label'] = 'Cuban Box',              ['weight'] = 0,            ['type'] = 'item',         ['image'] = 'cubanbox.png',              ['unique'] = false,         ['useable'] = false,    ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = ''},
    ['morebox']                   = {['name'] = 'morebox',                      ['label'] = 'More Box',              ['weight'] = 0,            ['type'] = 'item',         ['image'] = 'morebox.png',              ['unique'] = false,         ['useable'] = false,    ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = ''},

```
[qb] > qb-core > shared > jobs.lua
```
	['cigar'] = {
		label = 'Cigar Manager',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Sales', payment = 50 },
            ['1'] = { name = 'Manager', isboss = true, payment = 500 },
        },
	},
```


## Join With Us
- [Discord](https://discord.gg/JwWANh8EY5)
- [Tebex](https://kael.tebex.io/)

## More From Kael Scripts
- [Illegal Cargo Delivery](https://kael.tebex.io/package/5642002)
- [Pearls Job](https://kael.tebex.io/package/5672502)
- [Fivem Crypto Mining](https://kael.tebex.io/package/5547351)
- [Billing](https://kael.tebex.io/package/5624426)
- [Mechanic Run](https://kael.tebex.io/package/5684105)
- [Fivem Organ Run](https://kael.tebex.io/package/5677195)
- [Bean Machine Job](https://kael.tebex.io/package/5667470)
- [Japanese Job](https://kael.tebex.io/package/5617380)
- [Duplicate Anti](https://kael.tebex.io/package/5534122)
- [Advanced Item Rob](https://kael.tebex.io/package/5549462)
- [Street Begging](https://forum.cfx.re/t/fivem-street-begging-made-by-kael-scripts/5096244/7)
- [Oxy Run](https://forum.cfx.re/t/fivem-oxy-run-by-kael-script/5101946)
- [Free Ghost Attack](https://forum.cfx.re/t/fivem-ghost-attack-by-kael-scripts/5100620)
- [GPS Tracker](https://forum.cfx.re/t/fivem-gps-tracker-by-kael-scripts/5098948)
- [Job Garage](https://forum.cfx.re/t/fivem-job-garage-by-kael-scripts/5105236)
- [Advance HotDog](https://forum.cfx.re/t/fivem-advanced-hotdog-by-kael-scripts/5106703)
- [Trevor Mission](https://forum.cfx.re/t/fivem-trevor-mission-by-kael-scripts/5111679)
