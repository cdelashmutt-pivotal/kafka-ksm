# kafka-ksm
A collection of assets to use the Bitnami Kafka template with Container Services Manager (KSM)

## Usage
0. Clone this repo locally.
1. Use grab-and-upload-images.sh to pull down the Bitnami Kafka images and upload them to your private repo.
2. Install the KSM artifacts with something similar to the following: `ksm -t <KSM-ENDPOINT> -u ksm_api_admin -p <KSM-API-ADMIN-PASSWORD> offer save . kafka-11.3.2.tgz`

## See also
https://docs.pivotal.io/ksm