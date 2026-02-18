
local lib = exports.ox_lib
local dvCooldown = false
local Config = require 'client.config'


RegisterCommand('dv', function()
    if Config.EnableCooldown and dvCooldown then
        lib:notify({
            id = 'dv_cooldown',
            title = 'Cooldown Active',
            description = 'You are on a cooldown. Please wait before using /dv again.',
            showDuration = false,
            position = 'center-right',
            style = {
                backgroundColor = 'rgba(20, 21, 23, 0.85)',
                color = '#C1C2C5',
                ['.description'] = { color = '#909296' }
            },
            icon = 'ban',
            iconColor = '#C53030'
        })
        return
    end

    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle == 0 then
        local pos = GetEntityCoords(playerPed)
        local vehicles = GetGamePool('CVehicle')
        local closestVeh, minDist = nil, Config.DeleteRadius or 5.0
        for _, veh in ipairs(vehicles) do
            local vehPos = GetEntityCoords(veh)
            local dist = #(pos - vehPos)
            if dist < minDist then
                minDist = dist
                closestVeh = veh
            end
        end
        if closestVeh then
            if GetVehicleNumberOfPassengers(closestVeh) > 0 or not IsVehicleSeatFree(closestVeh, -1) then
                lib:notify({
                    id = 'dv_occupied',
                    title = 'Vehicle Occupied',
                    description = 'You cannot delete a vehicle with someone inside.',
                    showDuration = false,
                    position = 'center-right',
                    style = {
                        backgroundColor = 'rgba(20, 21, 23, 0.85)',
                        color = '#C1C2C5',
                        ['.description'] = { color = '#909296' }
                    },
                    icon = 'ban',
                    iconColor = '#C53030'
                })
                return
            end
            DeleteEntity(closestVeh)
            lib:notify({
                id = 'dv_success',
                title = 'Vehicle Deleted',
                description = 'The nearest vehicle has been removed.',
                showDuration = false,
                position = 'center-right',
                style = {
                    backgroundColor = 'rgba(20, 21, 23, 0.85)',
                    color = '#C1C2C5',
                    ['.description'] = { color = '#909296' }
                },
                icon = 'fa-solid fa-check',
                iconColor = '#38A169'
            })
        else
            lib:notify({
                id = 'dv_none',
                title = 'No Vehicle Found',
                description = 'There is no vehicle nearby to delete.',
                showDuration = false,
                position = 'center-right',
                style = {
                    backgroundColor = 'rgba(20, 21, 23, 0.85)',
                    color = '#C1C2C5',
                    ['.description'] = { color = '#909296' }
                },
                icon = 'ban',
                iconColor = '#C53030'
            })
            return
        end
    else
        if GetVehicleNumberOfPassengers(vehicle) > 0 then
            lib:notify({
                id = 'dv_occupied',
                title = 'Vehicle Occupied',
                description = 'You cannot delete a vehicle with someone inside.',
                showDuration = false,
                position = 'center-right',
                style = {
                    backgroundColor = 'rgba(20, 21, 23, 0.85)',
                    color = '#C1C2C5',
                    ['.description'] = { color = '#909296' }
                },
                icon = 'ban',
                iconColor = '#C53030'
            })
            return
        end
        DeleteEntity(vehicle)
        lib:notify({
            id = 'dv_success',
            title = 'Vehicle Deleted',
            description = 'Your vehicle has been removed.',
            showDuration = false,
            position = 'center-right',
            style = {
                backgroundColor = 'rgba(20, 21, 23, 0.85)',
                color = '#C1C2C5',
                ['.description'] = {
                    color = '#909296'
                }
            },
            icon = 'fa-solid fa-check',
            iconColor = '#38A169'
        })
    end

    if Config.EnableCooldown then
        dvCooldown = true
        SetTimeout((Config.CooldownTime or 5) * 1000, function()
            dvCooldown = false
        end)
    end
end, false)

exports.ox_target:addGlobalVehicle({
    label = 'Impound Vehicle',
    icon = 'fa-solid fa-car',
    onSelect = function(data)
        exports.dv:impoundVehicle(data.entity)
    end
})