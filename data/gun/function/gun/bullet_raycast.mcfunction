# 射线超出最大距离则终止（动态射程）
$execute unless entity @s[distance=..$(range)] run return 0

# 检查是否命中实体（检测点下移0.6格对齐怪物躯干中心）
execute positioned ~ ~-0.6 ~ if entity @e[type=#gun:hostile,distance=..1.3,sort=nearest,limit=1] run function gun:gun/bullet_hit with storage gun:temp
execute positioned ~ ~-0.6 ~ if entity @e[type=#gun:hostile,distance=..1.3,sort=nearest,limit=1] run scoreboard players remove @s gun_pen_left 1

# 穿透耗尽则终止射线
execute if score @s gun_pen_left matches ..0 run return 0

# 飞行粒子
particle crit ~ ~ ~ 0 0 0 0 1

# 碰到实心方块 → 墙壁撞击效果并终止
execute unless block ~ ~ ~ #gun:non_solid run function gun:gun/bullet_remove
execute unless block ~ ~ ~ #gun:non_solid run return 0

# 继续前进0.5格递归检测（传递宏参数）
execute positioned ^ ^ ^0.5 run function gun:gun/bullet_raycast with storage gun:temp
