function setBusy(state)
    LocalPlayer.state:set('busy', state, true)
end

function isBusy()
    return LocalPlayer.state.busy
end