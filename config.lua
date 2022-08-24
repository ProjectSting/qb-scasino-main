Config = {}

Config.SQL = 'oxmysql' --- oxmysql or ghmattisql

Config.Eye = "true" -- If you are using the QB Target then change this to true.

 Config.Locations = { 
    ["stations"] = {
        [1] = {label = ('Casino'), coords = vector4(989.0, 31.98, 71.47, 236.96)}
    }
}


Config.Items = {
label = "Shop",
    slots = 11,
    items = {
        [1] = {
            name = "cocktailglass",
            price = 1,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "banana",
            price = 1,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "cherry",
            price = 1,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "apple",
            price = 1,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "kiwi",
            price = 1,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "lemon",
            price = 1,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "lime",
            price = 1,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "orange",
            price = 1,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "watermelon",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "whiskey",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "vodka",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
	    [12] = {
            name = "ice",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 12,
        },
	}
}

Config.CasinoItems = {
label = "Casino Chips",
    slots = 1,
    items = {
        [1] = {
            name = "casinochips",
            price = 1,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },

    }
}
