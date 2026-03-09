#ps-hash
#By: Joseph Broda
#Compares the hash of a user-selected file to a provided hash value in PowerShell using a user-selected hashing algorithm.

#Get user input for file and official hash
$filePath = Read-Host "Enter the full path to the file"
$expectedHash = (Read-Host "Paste the expected hash here").Trim()
$choice = Read-Host "What algorithm is the hash? `n1. MD5`n2. SHA1 `n3. SHA256`n"

#Select hash algorithm
$selectedAlgorithm = switch ($choice) {
    1 { "MD5" }
    2 { "SHA1" }
    3 { "SHA256" }
    Default { Write-Host "Invalid choice"; exit }
}

#Generate hash for local file
$actualHash = (Get-FileHash -LiteralPath $filePath -Algorithm $selectedAlgorithm).Hash
Write-Host "Calculated hash using "$selectedAlgorithm": " $actualHash
Write-Host "Expected hash: " $expectedHash

#Perform comparison
if ($actualHash -eq $expectedHash) {
    Write-Host "SUCCESS: Hashes match!" -ForegroundColor Green
}
else {
    Write-Host "WARNING: Hashes do NOT match!" -ForegroundColor Red
}