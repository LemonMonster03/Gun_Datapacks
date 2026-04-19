# 正在装弹的玩家每tick减少装弹冷却
scoreboard players remove @a[scores={reload_cooldown=1.., reloading=1..}] reload_cooldown 1

# 装弹过程中分阶段播放音效（模拟退弹匣 → 装填 → 上膛）
execute as @a[scores={reloading=1..}] at @s if score @s reload_cooldown matches 30 run playsound minecraft:item.crossbow.loading_middle player @s ~ ~ ~ 0.8 1.2
execute as @a[scores={reloading=1..}] at @s if score @s reload_cooldown matches 15 run playsound minecraft:item.crossbow.loading_middle player @s ~ ~ ~ 0.8 1.5

# 装弹冷却结束时完成装弹
execute as @a[scores={reload_cooldown=..0, reloading=1..}] at @s run function gun:gun/reload_complete
