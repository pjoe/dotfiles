function Exec {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0, Mandatory = 1)][scriptblock]$cmd,
        [Parameter(Position = 1, Mandatory = 0)][string]$errorMessage = ("Error executing command {0}" -f $cmd)
    )
    & $cmd
    if ($lastexitcode -ne 0) {
        throw ("Exec: " + $errorMessage)
    }
}

function SymLinkForce($target, $link) {
    if (Test-Path -PathType Leaf $target) {
        Write-Host "Removing existing $link"
        Remove-Item $link
    }
    Exec { &cmd /c "mklink ""$link"" ""$target""" }
}

try {
    $ErrorActionPreference = "Stop"

    # Get current dir (so run this script from anywhere)
    $DOTFILES_DIR = "$PSScriptRoot"
    Write-Host "Installing from $DOTFILES_DIR to $HOME"

    # Update dotfiles itself first
    if (Test-Path -PathType Container "$DOTFILES_DIR/.git") {
        Write-Host "Updating dotfiles itself"
        Exec {
            git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master
        }
    }

    # Create symlinks
    SymLinkForce "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
    SymLinkForce "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"

    # gitconfig
    $GITCONFIG_PATH = "$DOTFILES_DIR\git\.gitconfig" -replace "\\","\\"
    $GITCONFIG_PREFIX = "[include]`n    path = ""$GITCONFIG_PATH""`n"
    if (Test-Path -PathType Leaf "$HOME/.gitconfig") {
        $GITCONFIG = Get-Content "$HOME/.gitconfig"
        if ($GITCONFIG -like "*$GITCONFIG_PATH*") {
            Write-Host "Already added gitconfig"
        } else {
            Write-Host "Adding gitconfig"
            Set-Content -Path "$HOME/.gitconfig" -Value "$GITCONFIG_PREFIX`n$GITCONFIG"
        }
    } else {
        Write-Host "Adding gitconfig"
        Set-Content -Path "$HOME/.gitconfig" -Value $GITCONFIG_PREFIX
    }

    Write-Host "Done"
}
catch {
    throw
}