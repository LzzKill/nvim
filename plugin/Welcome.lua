local s, p_notify = pcall(require, "notify")
local c_notify = vim.notify
local user = vim.fn.expand("$USER")   -- Username
local hour = tonumber(os.date("%H"))  -- Date

if s then
	c_notify = p_notify.notify
end

local notify = function(msg)
	c_notify(msg, "info", { title = "你好啊 " .. user .. "!", timeout = 300 })
end

if hour < 6 then
	notify("凌晨了，要注意休息吖~")
elseif hour < 9 then
	notify("早上好, 今天也要元气满满呐~")
elseif hour < 12 then
	notify("上午好, 要记得吃早饭吖~")
elseif hour < 14 then
	notify("中午好, 多出去走走吖~")
elseif hour < 17 then
	notify("下午好, 记得多喝水吖~")
elseif hour < 19 then
	notify("傍晚好, 记得多陪陪亲爱的人呐~")
elseif hour < 22 then
	notify("晚上好, 累了可以洗个热水澡哦~")
else
	notify("夜深了,快睡觉吧~")
end
