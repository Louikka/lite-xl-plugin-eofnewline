-- mod-version:3

local core = require 'core'
local config = require 'core.config'
local Doc = require 'core.doc'

config.plugins.eofnewline = {}


---@param doc core.doc
function config.plugins.eofnewline.add_new_line(doc)
    if doc.lines[#doc.lines] ~= "\n" then
        doc:insert(#doc.lines, math.huge, '\n')
    end
end


local doc_save = Doc.save
Doc.save = function(self, ...)
    config.plugins.eofnewline.add_new_line(self)
    doc_save(self, ...)
end

