STARTIMAGE = 'guiErrorCheck'
FIRST_RUN = true

err = 0
NETWORK_RESET_TIME = 600
ERR_NETWORK = 0

freeCycle= 1

cycle_total = 0

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

-- Region of Interest: Specific Info
detail_roi = {28, 73, 109, 144}

-- List of Groups in ImageMax Cycle
GROUPS = {
    'resetAccount',
    'gameStart',
    'selectGacha',
    'ssrGacha',
    'supportGacha',
    'umaAssess',
    'errorCallback'
    }
        
found_uma_list = {}

SAVE_SCREENSHOT_TRUE = false
SSR_ON = false
SSR_LOTS = true
SR_SEARCH_ON = true

SUCCESS = false
SCREENSHOT_FLAG = false

uma_off()