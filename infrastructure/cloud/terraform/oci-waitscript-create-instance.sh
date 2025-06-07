# This scripts just tries to bruteforce the creation of a VM.Standard.E2.1.Micro instance in OCI as you'd normally face a "Out of capacity" error
while [ ! -f /tmp/success_creation ]; do
  echo "Applying terraform"
  terraform apply --auto-approve && touch /tmp/success_creation
  echo "[ERROR] Retrying in 5 minutes"
  sleep 300
done