err = loopstep("doNotPick", "exitGacha", LOOP_ERR_SMALL, {true, 0,0})
if err_judge(err) > 0 then return 0 end

err = loopstep("exitGacha", "toInventory", LOOP_ERR_LARGE, {true, 0,0})
if err_judge(err) > 0 then return 0 end

err = loopstep("toInventory", "supportCard", LOOP_ERR_SMALL, {true, 0,0})
if err_judge(err) > 0 then return 0 end

err = loopstep("supportCard", "cardUpgrade", LOOP_ERR_SMALL, {true, 0,0})
if err_judge(err) > 0 then return 0 end

err = loopstep("cardUpgrade", "closeBanner", LOOP_ERR_SMALL, {true, 0,0})
if err_judge(err) > 0 then return 0 end

err = loopstep("closeBanner", "enteredUpgrade", LOOP_ERR_SMALL, {true, 0,0})
if err_judge(err) > 0 then return 0 end


-- Save screenshot
filepath = SaveScreenshot()

name = 0
yeardate = 0
tmp_i = 0
for value in string.gmatch(filepath, "[^/]+") do
	tmp_i = tmp_i + 1
	print(value)
	if tmp_i == 4 then
		yeardate = value
	end
	name = value
end

changed_name = target_port.."_"..name

before_name = filepath
after_name = filepath:gsub(name, changed_name)

save_name = changed_name:match("(.+)%..+")

print("account saved : "..save_name)


os.execute("mkdir ..\\screenshot")

current_dir=io.popen"cd ../screenshot && cd":read'*l'

print(current_dir)
print(before_name)

os.rename(before_name, current_dir.."/"..changed_name)

SAVE_SCREENSHOT_TRUE = true


-- saveData
head_command = "cd ../../ADB && "
adb_command = "adb -s "..device_name.." shell /system/xbin/bstk/su -c mv /data/data/com.kakaogames.umamusume/shared_prefs /data/data/com.kakaogames.umamusume/account/"..save_name
command = head_command..adb_command

local f = io.popen(command)
f:close()


log_name = save_name

file = io.open("../SSRlog.txt","a+")
print([[###################]])
print([[###################]])
file:write(tostring(log_name)..[[,]])
print(log_name)
for k, v in pairs(found_uma_list)
do
	if k ~= nil then 
		print(tostring(UMA_LIST[k])..[[=]]..tostring(v))
		file:write(tostring(UMA_LIST[k])..[[=]]..tostring(v))
	end
end

file:write("\n")

print([[###################]])
print([[###################]])

file:close()

COUNT = COUNT+1

print('¸®¼¼È½¼ö : '..COUNT)

EnableImage(true,'isFinished')