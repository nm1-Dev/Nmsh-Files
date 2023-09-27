local event_test = false
-- Client-side tests
ClientTests = {
    Menu = {
        active = false,
        options = {}
    },
    Event = {
        active = event_test,
        options = {

        }
    }
}

-- Server-side tests
TestTarget = 1
ServerTests = {
    Item = {
        active = false,
        options = {
            item_name = 'ring1',
            -- make sure inventory has an empty slot
            slot = 1,
            metadata = {
                test = 'test_value'
            }
        }
    },
    -- stash test is not fully functional
    Stash = {
        active = false,
        options = {
            prefix = 'text_',
            id = 'test_id'
        }
    },
    Discord = {
        active = false,
        options = {
            has_roles = {
                'Dev',
                968231731444465664
            },
            webhook_only = true,
            -- to test webhook make sure you've entered the defualt webhook
            -- or it won't work
        }
    },
    Chance = {
        -- this is a heavy task don't
        -- it will stress the server only test it on local server
        -- or when nobdy is playing on the main server
        -- or lower counts by large margin
        active = false,
        options = {
            count = 10000,
            AliasSampler = {
                samples = { 1, 2, 3, 4 },
                expected = { 0.1, 0.2, 0.3, 0.4 }
            },
            -- interface test
            individual = {
                samples = {
                    {
                        chance = 10,
                    },
                    {
                        chance = 20,
                    },
                    {
                        chance = 30,
                    },
                    {
                        chance = 40,
                    }
                },
                expected = {
                    [10] = 0.1,
                    [20] = 0.2,
                    [30] = 0.3,
                    [40] = 0.4,
                }
            },
            all = {
                samples = {
                    {
                        chance = 10,
                    },
                    {
                        chance = 20,
                    },
                    {
                        chance = 30,
                    },
                    {
                        chance = 40,
                    },
                    {
                        chance = 100,
                    }
                },
                expected = {
                    [10] = 0.1,
                    [20] = 0.2,
                    [30] = 0.3,
                    [40] = 0.4,
                    [100] = 1,
                }
            }
        }
    },
    Command = {
        active = false,
        options = {
            name = 'test',
            help = 'something random',
            arg = { { name = '3453', help = '34534' } },
            require = false,
            callback = function(source, args, raw)
                print('source', source)
                HarmonyShared.pt(args)
            end
        }
    },
    Event = {
        active = event_test,
        options = {

        }
    }
}
