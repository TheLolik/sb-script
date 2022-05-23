-- Theres only patched functions which can make you get banned

tab:Toggle("Loop-use sword ability.",false, function(t)
    lsa = t
    while lsa == true and game.RunService.RenderStepped:Wait() do
        f:fire("ability")
    end
end)
