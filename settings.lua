data:extend(
{
  {
    type = "bool-setting",
    name = "mop-labor",
    setting_type = "startup",
    default_value = true,
  },
  {
	type = "int-setting",
    name = "mop-ticks-per-reactor",
    setting_type = "startup",
	minimum_value = 1,
	maximum_value = 600,
	default_value = 60
  },

}
)

