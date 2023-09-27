QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.QBJobsStatus = false -- true: integrate nmsh-jobs into the whole of qb-core | false: treat nmsh-jobs as an add-on resource.
QBShared.Jobs = {} -- All of below has been migrated into nmsh-jobs
if QBShared.QBJobsStatus then return end
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Freelancer',
                payment = 10
            },
        },
	},
    ['vapeshop'] = {
		label = 'Vape Shop',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 500 },
			['1'] = { name = 'Management', isboss = true, payment = 0 },
        },
	},
    ['cigar'] = {
		label = 'Cigar Manager',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Sales', payment = 50 },
            ['1'] = { name = 'Manager', isboss = true, payment = 500 },
        },
	},
    ['limeys'] = {
		label = 'Limeys Juice Bar',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Employee',
                payment = 50
            },
            ['1'] = {
                name = 'Juice Maker',
                payment = 50
            },
            ['2'] = {
                name = 'Floor Manager',
                payment = 50
            },
            ['3'] = {
                name = 'GENERAL MANAGER',
                payment = 50
            },
            ['4'] = {
                name = 'OWNER',
                isboss = true,
                payment = 50
            },
        },
	},
    ["beanmachine"] = {
        label = "Bean Machine",
        offDutyPay = false,
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Worker',
                payment = 30,
            },
            ['1'] = {
                name = 'Vice Boss',
                payment = 70,
            },
            ['2'] = {
                name = 'Boss',
                isboss = true,
                payment = 130,
            },
        }
    },
    ['uwu'] = {
        label = 'UwU Cafe',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 50
            },
            ['1'] = {
                name = 'Employee',
                payment = 75
            },
            ['2'] = {
                name = 'Advanced',
                payment = 125
            },
            ['3'] = {
                name = 'Manager',
                payment = 150
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 150
            },
        },
    },
    ["koi"] = {
        label = "KOI Restaurant",
        offDutyPay = true,
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Employee',
                payment = 30,
            },
            ['1'] = {
                name = 'Vice Manager',
                payment = 70,
            },
            ['2'] = {
                name = 'Manager',
                isboss = true,
                payment = 130,
            },
        },
    },
    ['oilwell'] = {
        label = 'Oil Company',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Oilwell Operator',
                payment = 50
            },
            ['1'] = {
                name = 'Oilwell Operator tier 2',
                payment = 75
            },
            ['2'] = {
                name = 'Event Driver tier 2',
                payment = 100
            },
            ['3'] = {
                name = 'Sales',
                payment = 125
            },
            ['4'] = {
                name = 'CEO',
                isboss = true,
                payment = 150
            },
        },
    },
    ['airport'] = {
        label = 'Airport',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 0
            },
            ['1'] = {
                name = 'Pilot',
                payment = 0
            },
            ['2'] = {
                name = 'Lead Pilot',
                payment = 0
            },
            ['3'] = {
                name = 'Air-Traffic Controller',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
	['police'] = {
		label = 'Law Enforcement',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
        grades = {
            ['0'] = {
                label = "LSPD",
                payment = 500,
            },
            ['1'] = {
                label = 'Cadet',
                payment = 600,
            },
            ['2'] = {
                label = 'Solo Cadet',
                payment = 750,
            },
            ['3'] = {
                label = 'Officer',
                payment = 800,
            },
            ['4'] = {
                label = 'Officer II',
                payment = 850,
            },
            ['5'] = {
                label = 'Senior Officer',
                payment = 900,
            },
            ['6'] = {
                label = 'Sergeant',
                payment = 950,
            },
            ['7'] = {
                label = 'Sergeant I',
                payment = 1000,
            },
            ['8'] = {
                label = 'Staff Sergeant',
                payment = 1050,
            },
            ['9'] = {
                label = 'Lieutenant',
                payment = 1100,
            },
            ['10'] = {
                label = 'Lieutenant I',
                payment = 1150,
            },
            ['11'] = {
                label = 'Captain',
                payment = 1200,
                isboss = true,
            },
            ['12'] = {
                label = 'Major',
                payment = 1250,
                isboss = true,
            },
            ['13'] = {
                label = 'Chief of Police',
                payment = 1650,
                isboss = true,
            },
        },
    },
    ['burgershot'] = {
		label = 'BurgerShot',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
			['0'] = {
				name = 'Recruit',
				payment = 175
			},
			['1'] = {
				name = 'Crew Member',
				payment = 185
			},
			['2'] = {
				name = 'Shift Manager',
				payment = 195
			},
			['3'] = {
				name = 'Manager',
				payment = 205
			},
			['4'] = {
				name = 'Owner',
				isboss = true,
				payment = 215
			},
		},
	},
	['ambulance'] = {
		label = 'EMS',
        type = 'ems',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Paramedic',
                payment = 75
            },
			['2'] = {
                name = 'Doctor',
                payment = 100
            },
			['3'] = {
                name = 'Surgeon',
                payment = 125
            },
			['4'] = {
                name = 'Chief',
				isboss = true,
                payment = 150
            },
        },
	},
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'House Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Broker',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Driver',
                payment = 75
            },
			['2'] = {
                name = 'Event Driver',
                payment = 100
            },
			['3'] = {
                name = 'Sales',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
    ['bus'] = {
		label = 'Bus',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
		},
	},
	['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Finance',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['mechanic'] = {
		label = 'Mechanic',
        type = "mechanic",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Novice',
                payment = 75
            },
			['2'] = {
                name = 'Experienced',
                payment = 100
            },
			['3'] = {
                name = 'Advanced',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['judge'] = {
		label = 'Honorary',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
                payment = 100
            },
        },
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Associate',
                payment = 50
            },
        },
	},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 50
            },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
        },
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Collector',
                payment = 50
            },
        },
	},
	['vineyard'] = {
		label = 'Vineyard',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Picker',
                payment = 50
            },
        },
	},
	['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Sales',
                payment = 50
            },
        },
	},
    ['auction'] = {
		label = 'Auction',
		defaultDuty = true,
		offDutyPay = false,
        withoutM = true,
		grades = {
            ['0'] = {
                label = 'Auction Manager',
                payment = 30
            },
        },
	},
}
