function dotpush
    # Ensure we're in the dotfiles directory
    cd ~/dotfiles; or begin
        echo "Failed to cd into ~/dotfiles"
        return 1
    end

    if test (count $argv) -eq 0
        echo "Please provide a commit message."
        echo "Usage: dotpush \"Your commit message\""
        return 1
    end

    set msg $argv

    echo "==> Running git status"
    git status; or return 1

    echo "\n==> Running git add --all"
    git add --all; or return 1

    echo "\n==> Running git commit"
    git commit -m "$msg"; or return 1

    echo "\n==> Running git push"
    git push; or return 1

    echo "\nAll done."
end
