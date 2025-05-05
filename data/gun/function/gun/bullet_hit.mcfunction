# 对命中的实体造成伤害(使用伤害值为7的近战伤害)
execute as @e[type=#gun:hostile,distance=..1.7,sort=nearest,limit=1] run damage @s 7 minecraft:player_attack by @p

# 添加命中音效
playsound entity.arrow.hit_player player @a ~ ~ ~ 1 1
playsound entity.player.hurt neutral @a ~ ~ ~ 0.5 1

# 生成击退效果(可选)
# execute as @e[type=#gun:hostile,distance=..0.7,sort=nearest,limit=1] at @s run tp @s ^ ^ ^-5.5