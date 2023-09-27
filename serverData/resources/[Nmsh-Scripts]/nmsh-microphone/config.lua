Config = {}

Config.Showzone = false

Config.MicrophoneZones = {
    [1] = {
        name = "vinewood_bowl", 
        coords = vector3(683.37, 569.31, 130.46),
        length = 3.4,
        width = 3.6,
        spawnProp = true, -- if set to true, it will let you spawn the prop at location
        data = {
            debugPoly = Config.Showzone,
            heading = 340,
            minZ = 127.86,
            maxZ = 131.86,
            data = {
                range = 50.0 -- range for the voice
            }
        }
    },
    [2] = {
        name = "mrpd", 
        coords = vector3(440.98, -985.72, 34.97),
        length = 1.6,
        width = 1.0,
        spawnProp = false, -- if set to true, it will let you spawn the prop at location
        data = {
            debugPoly = Config.Showzone,
            heading = 340,
            minZ = 33.97,
            maxZ = 36.57,
            data = {
                range = 20.0 -- range for the voice
            }
        }
    }
}