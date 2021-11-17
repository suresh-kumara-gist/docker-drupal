VERSION="$1"
BASEIMAGEVERSION="$2"

echo "*************"
echo "** REBUILDING VERSION $1"
echo "** USING BASE IMAGE $2"
echo "*************"

# Start by getting the latest version of the official drupal image
docker pull drupal:"$BASEIMAGEVERSION"

# Rebuild the entire thing
docker buildx build -t dcycle/drupal:"$VERSION" --platform linux/amd64,linux/arm64/v8 --push .
docker buildx build -t dcycle/drupal:"$VERSION.$DATE" --platform linux/amd64,linux/arm64/v8 --push .
