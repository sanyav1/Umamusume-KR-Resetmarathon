Sleep(1000)

-- Input trainer info
Mouse(LBUTTON, CLICK, 123, 322, 123, 322, 0, 0, 0.3, 1, FASTER, MESSAGE)
Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTER, MESSAGE)
Keybd('KITASAN<Enter>', FASTER, MESSAGE)
Mouse(LBUTTON, CLICK, 198, 461, 198, 461, 0, 0, 0.3, 1, FASTER, MESSAGE)
Mouse(LBUTTON, UP, 0, 0, 0, 0, 0, 0, 0.2, 1, FASTER, MESSAGE)

err = loopstep("trainerOK", "skipGift", LOOP_ERR_LARGE, {true, 0, 0})
if err_judge(err) > 0 then return 0 end

err = loopstep("skipGift", "notifications", LOOP_ERR_LARGE*2, {true, 0, 0})
if err_judge(err) > 0 then return 0 end

err = loopstep("notifications", "mainStory", LOOP_ERR_LARGE, {true, 374,25})
if err_judge(err) > 0 then return 0 end

err = loopstep("mainStory", "umaStory", LOOP_ERR_LARGE, {true, 202,464})
if err_judge(err) > 0 then return 0 end

err = loopstep("umaStory", "giftBox", LOOP_ERR_LARGE, {true, 201,658})
if err_judge(err) > 0 then return 0 end

err = loopstep("giftBox", "getAll", LOOP_ERR_LARGE, {true, 0, 0})
if err_judge(err) > 0 then return 0 end

err = loopstep("getAll", "getOK", LOOP_ERR_LARGE, {true, 0, 0})
if err_judge(err) > 0 then return 0 end

err = loopstep("getOK", "noGift", LOOP_ERR_LARGE, {true, 201, 658})
if err_judge(err) > 0 then return 0 end

err = loopstep("noGift", "goGacha", LOOP_ERR_LARGE, {true, 113, 656})
if err_judge(err) > 0 then return 0 end

err = loopstep("goGacha", "gachaStandby", LOOP_ERR_LARGE, {true, 0, 0})
if err_judge(err) > 0 then return 0 end