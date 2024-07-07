---@alias TraceReport {type: "trace", computer: integer, isStartup: boolean, traceback: string, timestamp: integer}
---@alias EndedReport {type: "programEnded", computer: integer, timestamp: integer}

---@alias Report
---| TraceReport
---| EndedReport

rednet.open("top")
rednet.host("errorReporting", "errorReportingService")


while true do
    local id, message, protocol = rednet.receive("errorReporting")
    print(id, textutils.serialise(message), protocol)
    if type(message) == "table" then
        local fh = fs.open("/logs", "a")
        if not fh then
            error("Unable to get /logs file handle")
        end
        fh.write(textutils.serialiseJSON(message))
        fh.close()
    end
end
