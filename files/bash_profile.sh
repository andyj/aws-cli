
s3search(){
  echo "What Bucket do you want to search?"
  read BUCKETNAME
  aws s3 ls --endpoint ${ENDPOINT} s3://$BUCKETNAME  --recursive | grep -E
}


