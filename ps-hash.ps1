#ps-hash
#By: Joseph Broda
#Compares the hash of a user-selected file to a provided hash value in PowerShell using a user-selected hashing algorithm.

#Get user input for file and official hash
$filePath = Read-Host "Enter the full path to the file"
$expectedHash = Read-Host "Paste the expected hash here"
$algorithm = Read-Host "What algorithm is the hash? `n1. MD5`n2. SHA1 `n3. SHA256`n"

#Select hash algorithm
if ($algorithm -eq 1) {
    $selectedAlgorithm = "MD5"
}
elseif ($algorithm -eq 2) {
    $selectedAlgorithm = "SHA1"
}
elseif ($algorithm -eq 3) {
    $selectedAlgorithm = "SHA256"
}
else {
    Write-Host "Incorrect option. Try again."
    exit
} 

#Generate hash for local file
$actualHash = (get-FileHash -Path $filePath -Algorithm $selectedAlgorithm).Hash
Write-Host "Calculated hash using "$selectedAlgorithm": " $actualHash

#Perform comparison
if ($actualHash -eq $expectedHash) {
    Write-Host "The hashes match. This file is safe." -ForegroundColor Green
}
else {
    Write-Host "The hashes do NOT match. The file may be corrupted or tampered with." -ForegroundColor Red
}