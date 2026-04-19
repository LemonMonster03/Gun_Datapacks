# [未使用] 此文件为基于实体的子弹初始化逻辑，当前主流程使用 bullet_raycast 的纯射线方案

# 移除新子弹标签
tag @s remove new_bullet

# 添加枪口火焰粒子
particle flame ~ ~ ~ 0 0 0 0.01 5
particle smoke ~ ~ ~ 0.1 0.1 0.1 0.01 10

# 立即开始子弹飞行
function gun:gun/bullet_travel
