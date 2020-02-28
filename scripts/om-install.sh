#!/usr/bin/env bash
# From an installation project folder (configured to connect to pcf/opsmanager), run following to upload tiles 
# wget -qO- "https://gist.github.com/yogendra/318c09f0cd2548bdd07f592722c9bbec/raw/om-install.sh"  | bash

PCF_IAAS=${PCF_IAAS:-google}
TILES_DIR=${TILE_DIR:-$PWD}
download_file=$TILES_DIR/download-file.json

function om-install(){
    product=$1
    fileglob=$2
    version=${3:-`pivnet rs -p $product -l 1 -o json | jq -r '.[0].version'`}
    echo "Download $product :: $version ($fileglob)"
    om download-product --pivnet-api-token $OM_PIVNET_TOKEN  --product $product --product-version $version --pivnet-file-glob $fileglob --download-stemcell --stemcell-iaas=$PCF_IAAS --output-directory $TILES_DIR
    tile_path=$(jq -r '.product_path' $download_file)
    tile_version=$(jq -r '.product_version' $download_file)
    tile_slug=$(jq -r '.product_slug' $download_file)
    om -k upload-product -p $tile_path  
}
if [[ $# -lt 2 ]]; then
    cat <<EOF
om-install product-slug filename [version]
EOF
    exit 1
fi
om-install $*
# pipe apm "apm\*.pivotal"
# pipe credhub-service-broker "credhub-service-broker\*.pivotal"
# pipe p-cloud-cache "p-cloud-cache\*.pivotal"
# pipe p-dataflow "p-dataflow\*.pivotal"
# pipe p-event-alerts "p-event-alerts\*.pivotal"
# pipe p-healthwatch "p-healthwatch\*.pivotal"
# pipe p-rabbitmq "p-rabbitmq\*.pivotal"
# pipe p-redis "p-redis-\*.pivotal"
# pipe p-scheduler "p-scheduler\*.pivotal"
# pipe p-spring-cloud-services "p-spring-cloud-services-\*.pivotal"
# pipe pivotal-mysql "pivotal-mysql\*.pivotal"
# pipe pivotal_single_sign-on_service "Pivotal_Single_Sign-On_Service\*.pivotal"
