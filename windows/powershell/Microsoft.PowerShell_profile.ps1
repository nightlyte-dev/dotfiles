# eza aliases
function ezals {
    eza -la --icons --color=always --group-directories-first
}
Set-Alias ls ezals

# Updates PowerShell via the official install script, calls the old version of PowerShell to prevent issues (lmao)
function psupdate {
    iex "& { $(irm https://raw.githubusercontent.com/PowerShell/PowerShell/master/tools/install-powershell.ps1 -UseBasicP) }"
}

# yazi alias
function y {
	$tmp = (New-TemporaryFile).FullName
	yazi.exe $args --cwd-file="$tmp"
	$cwd = Get-Content -Path $tmp -Encoding UTF8
	if ($cwd -and $cwd -ne $PWD.Path -and (Test-Path -LiteralPath $cwd -PathType Container)) {
		Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
	}
	Remove-Item -Path $tmp
}

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# scoop-search replacement
. ([ScriptBlock]::Create((& scoop-search --hook | Out-String)))

function Invoke-Starship-TransientFunction {
  &starship module character
}

Invoke-Expression (&starship init powershell)

Enable-TransientPrompt

Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })
