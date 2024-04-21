# Read the list from the file and install each extension
Get-Content "extensions.txt" | ForEach-Object {
  code --install-extension $_ --force
}

Write-Host "All extensions have been installed."
