STARTIMAGE = 'guiErrorCheck'
FIRST_RUN = true

err = 0
NETWORK_RESET_TIME = 1800

SMALLSLEEP = 300

cycle_set = 0
cycle_total = 0
cycle_R = 0
cycle_SSR = 0
cycle_SR = 0

SSR_list = {}
SR_list = {}
R_list = {}

-- Region of Interest: Grade
roi = {
{45, 79, 21, 14},
{165, 79, 21, 14},
{285, 79, 21, 14},

{105, 212, 21, 14},
{225, 212, 21, 14},

{45, 347, 21, 14},
{165, 347, 21, 14},
{285, 347, 21, 14},

{105, 483, 21, 14},
{225, 483, 21, 14}
}

-- Region of Interest: Card
CARD_roi = {
{39, 79, 83, 107},
{159, 79, 83, 107},
{279, 79, 83, 107},

{99, 212, 83, 107},
{219, 212, 83, 107},

{39, 347, 83, 107},
{159, 347, 83, 107},
{279, 347, 83, 107},

{99, 482, 83, 107},
{219, 482, 83, 107}
}

detail_roi = {28, 73, 109, 144}

freeCycle= 1

ERR_NETWORK = 0

GROUPS = {
    'resetAccount',
    'gameStart',
    'selectGacha',
    'ssrGacha',
    'supportGacha',
    'umaAssess',
    'errorCallback'
    }
    
uma_off()
    
found_uma_list = {}

SAVE_SCREENSHOT_TRUE = false
SSR_ON = false
SSR_LOTS = true
SR_SEARCH_ON = true

SUCCESS = false
SCREENSHOT_FLAG = false