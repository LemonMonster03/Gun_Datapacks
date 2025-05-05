
scoreboard players remove @a[scores={reload_cooldown=1.., reloading = 1..}] reload_cooldown 1
# execute as @s at @s if entity @s[scores={reload_cooldown=1.., reloading = 1..}] run function gun:gun/reloading
execute as @a[scores={reload_cooldown=..0, reloading = 1..}] at @s run function gun:gun/reload_complete