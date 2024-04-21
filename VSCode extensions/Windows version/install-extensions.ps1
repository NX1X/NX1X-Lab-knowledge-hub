Get-Content "extensions-win.txt" | ForEach-Object {
  code --install-extension $_ --force
}

Write-Host "All extensions have been installed."
