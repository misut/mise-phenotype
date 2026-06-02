local platform_map = {
    ["darwin-arm64"]  = "aarch64-apple-darwin",
    ["linux-amd64"]   = "x86_64-linux-gnu",
    ["windows-amd64"] = "x86_64-pc-windows-msvc",
}

local function supported_platforms()
    local keys = {}
    for key, _ in pairs(platform_map) do
        table.insert(keys, key)
    end
    table.sort(keys)
    return table.concat(keys, ", ")
end

local function archive_prefix(version)
    local major, minor = version:match("^(%d+)%.(%d+)")
    if major and minor and tonumber(major) == 0 and tonumber(minor) < 16 then
        return "phenotype-cli"
    end
    return "phenotype"
end

function PLUGIN:PreInstall(ctx)
    local version = ctx.version:gsub("^v", "")
    local key = RUNTIME.osType .. "-" .. RUNTIME.archType
    local platform = platform_map[key]
    if not platform then
        error("unsupported platform: " .. key .. " (supported: " .. supported_platforms() .. ")")
    end

    local ext = (RUNTIME.osType == "windows") and ".zip" or ".tar.gz"
    local filename = archive_prefix(version) .. "-v" .. version .. "-" .. platform .. ext

    return {
        version = version,
        url = "https://github.com/misut/phenotype/releases/download/v"
            .. version .. "/" .. filename,
    }
end
