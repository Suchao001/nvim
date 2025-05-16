function New-SymLink ($link, $target)
{
    if ($PSVersionTable.PSVersion.Major -ge 5)
    {
        New-Item -Path $link -ItemType SymbolicLink -Value $target -Force
    }
    else
    {
        $command = "cmd /c mklink /d"
        Invoke-Expression "$command ""$link"" ""$target"""
    }
}

$CurrentLocation = (Get-Location).Path

Remove-Item -Path "$HOME\AppData\Local\nvim-data" -Force -Recurse
Remove-Item -Path "$HOME\AppData\Local\nvim" -Force -Recurse
Remove-Item -Path "$HOME\.conifg\nvim" -Force -Recurse

New-SymLink -link "$HOME\AppData\Local\nvim" -target (Join-Path $CurrentLocation "nvim")
New-SymLink -link "$HOME\.conifg\nvim" -target (Join-Path $CurrentLocation "nvim")