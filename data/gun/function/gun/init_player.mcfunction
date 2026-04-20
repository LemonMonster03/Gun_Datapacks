# 初始化新玩家的所有枪械相关分数
scoreboard players set @s ammo 0
scoreboard players set @s reloading 0
scoreboard players set @s reload_cooldown 0
scoreboard players set @s gun_cooldown 0
scoreboard players set @s gun_shake 0
scoreboard players set @s gun_shake_up 0
scoreboard players set @s gun_shake_down 0
scoreboard players set @s gun_shake_gap 0
scoreboard players set @s gun_init 1
tellraw @s {text:"[枪械系统] 按F将枪放到副手即可装弹，右键射击",color:"gray",italic:true}
