--data.lua

local injectionPress = table.deepcopy(data.raw["item"]["electric-furnace"]) -- copy the table that defines the heavy armor item into the fireArmor variable

injectionPress.name = "injection-press"
injectionPress.icons = {
  {
    icon = "__forktorio__/graphics/icon.png",
    icon_size = injectionPress.icon_size,
  },
}

injectionPress.order = "c[injection-press]"
injectionPress.place_result = "injection-press"
-- create the recipe prototype from scratch
local recipe = {
  type = "recipe",
  name = "injection-press",
  enabled = true,
  energy_required = 5, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{"electric-furnace", 1}, {"steel-plate", 10}, {"advanced-circuit", 4}, {"transport-belt", 2}, {"inserter", 1}},
  result = "injection-press"
}

local injectionPressEntity = table.deepcopy(data.raw["furnace"]["electric-furnace"])

injectionPressEntity.name = "injection-press"
injectionPressEntity.minable = {mining_time = 0.2, result = "injection-press"}
injectionPressEntity.crafting_categories = {"injection-moulding"}
injectionPressEntity.icon = "__forktorio__/graphics/icon.png"
injectionPressEntity.animation.layers =
      {
        {
          filename = "__forktorio__/graphics/spritesheet.png",
          priority = "high",
          width = 239,
          height = 219,
          frame_count = 235,
          line_length = 15,
          shift = {0.421875, -0.2},
          scale = 0.5,
        },
        {
          filename = "__forktorio__/graphics/shadow.png",
          priority = "high",
          width = 220,
          height = 220,
          frame_count = 1,
          repeat_count = 235,
          shift = {0.421875, -0.2},
          draw_as_shadow = true,
          scale = 0.65,
        }
}
injectionPressEntity.working_visualisations = {
  {
    draw_as_light = true,
    fadeout = true,
    animation = {
      layers = {
        {
          filename = "__forktorio__/graphics/emission_sheet.png",
          priority = "high",
          width = 239,
          height = 219,
          frame_count = 235,
          line_length = 15,
          blend_mode = "additive",
          shift = {0.421875, -0.2},
          scale = 0.5,
        },
}
    }}}

data:extend(
{
  {
    type = "recipe-category",
    name = "injection-moulding" 
  },
})

local plasticFork = table.deepcopy(data.raw["item"]["plastic-bar"]) -- copy the table that defines the heavy armor item into the fireArmor variable

plasticFork.name = "plastic-fork"
plasticFork.icons = {
  {
    icon = "__forktorio__/graphics/plastic-fork.png",
  },
}
local forkrecipe = {
  type = "recipe",
  category = "injection-moulding",
  name = "plastic-fork",
  enabled = true,
  energy_required = 5, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{"plastic-bar", 2}},
  results = {{type = "item", name = "plastic-fork", amount = 5}}
}

data:extend{plasticFork, forkrecipe}
data:extend{injectionPressEntity}
data:extend{injectionPress, recipe}