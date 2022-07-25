# Remove nhost data
nhost purge
nhost down
rm -r .nhost
# run the server
nhost dev --debug