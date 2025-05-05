execute unless entity @s[distance=..15] run return 0

# 检查是否命中实体
execute positioned ~ ~ ~ if entity @e[type=#gun:hostile,distance=..1.0,sort=nearest,limit=1] run function gun:gun/bullet_hit

# 粒子效果
# particle dust{color: [0.0, 0.0, 1.0], scale: 1.0} ~ ~1 ~ 0.1 0.1 0.1 1 10
particle crit ~ ~1 ~ 0 0 0 0 1

# 检查当前方块是否可穿透
execute if block ~ ~ ~ #gun:non_solid positioned ^ ^ ^0.5 run function gun:gun/bullet_raycast