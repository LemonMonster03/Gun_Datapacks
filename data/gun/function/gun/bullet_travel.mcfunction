# [未使用] 此文件为基于实体的子弹飞行逻辑，当前主流程使用 bullet_raycast 的纯射线方案
# 如需切换为实体子弹方案可恢复使用

# 向前移动一小段距离
tp @s ^ ^ ^0.5

# 添加子弹飞行粒子
particle dust{color:[0.0,0.0,1.0],scale:1.0} ~ ~1 ~ 0.1 0.1 0.1 1 10
particle crit ~ ~1 ~ 0 0 0 0 1

# 检测碰撞实体
execute positioned ~ ~ ~ if entity @e[type=#gun:hostile,distance=..4.7,sort=nearest,limit=1] run function gun:gun/bullet_hit

# 检测碰撞方块（实心方块）
execute unless block ~ ~ ~ #gun:non_solid run function gun:gun/bullet_remove

# 未碰撞则继续飞行（递归调用，30格上限）
execute positioned ~ ~ ~ unless entity @e[type=#gun:hostile,distance=..0.7] if block ~ ~ ~ #gun:non_solid positioned ^ ^ ^0.5 if entity @s[distance=..30] run function gun:gun/bullet_travel

# 超出最大飞行距离则移除子弹实体
execute if entity @s[distance=30..] run kill @s
