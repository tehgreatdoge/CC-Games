-- Type definitions for the ui, not needed on the computer

---@class (exact) ApplicationState
---@field window Window
---@field data table
---@field getTitle fun(state: self): string
---@field initialize fun(state: self)
---@field onOpen fun(state: self)
---@field saveState fun(state: self): table
---@field restoreState fun(state: self, data: table)
---@field handleClick fun(state: self, button:1|2|3, x:integer, y:integer)
---@field handleKey fun(state: self, key: integer, is_held: boolean): boolean
---@field handleChar fun(state: self, char: string)
local ApplicationState = {

}
