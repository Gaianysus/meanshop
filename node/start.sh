#!/bin/bash -l

if [ ! -z ${MEANGO_HOST+x} ]
  then
    echo "$MEANGO_HOST meango.meangohost.com meango">>/etc/hosts
fi

if [ ! -z ${MEANGO_DEBUG+x} ]
  then
    echo '>>>>>>>>>>>>>>DEBUG<<<<<<<<<<<<<<<<<<<<'
    env
    cat /etc/hosts
    echo "meango host = $MEANGO_HOST"
    if [[ ${MEANGO_DEBUG} == "du" ]]; then
      echo '>>>>HOGS in meanshop are:<<<<'
      du -sh /meanshop/*
      echo '<<<<<<<<<END HOGS>>>>>>>>>'
    fi
    echo '>>>>>>>>>>>>>>>>>END_DEBUG<<<<<<<<<<<<<<<<<<'
fi

# if [ ! -z ${BRAINTREE_MERCHANT_ID+x} ]
#  then

# NOTE!
# I am nullifying this as it appears the code already uses the env vars
# as it is. So it is not necessary to create this local.env.js all we 
# need to do is set environment vars on the docker run command, or in Rancher, etc

#    export LCLENVPATH = '/meango/server/config'
#    export DEST_SCRIPT = "$LCLENVPATH/local.env.js"
#    export TEMPLATE_SCRIPT = "$LCLENVPATH/local.env.sample.js.template"


#    cp $TEMPLATE_SCRIPT $DEST_SCRIPT
#    sed -i "s/REPLACEME_FACEBOOK_ID/$FACEBOOK_ID/" $DEST_SCRIPT
#    sed -i "s/REPLACEME_FACEBOOK_SECRET/$FACEBOOK_SECRET/" $DEST_SCRIPT
#    sed -i "s/REPLACEME_TWITTER_ID/$TWITTER_ID/" $DEST_SCRIPT
#    sed -i "s/REPLACEME_TWITTER_SECRET/$TWITTER_SECRET/" $DEST_SCRIPT
#    sed -i "s/REPLACEME_GOOGLE_ID/$GOOGLE_ID" $DEST_SCRIPT
#    sed -i "s/REPLACEME_GOOGLE_PASSWORD/$GOOGLE_SECRET/" $DEST_SCRIPT
#    sed -i "s/REPLACEME_BRAINTREE_MERCHANT_ID/$BRAINTREE_MERCHANT_ID/" $DEST_SCRIPT
#    sed -i "s/REPLACEME_BRAINTREE_PUBLIC_KEY/$BRAINTREE_PUBLIC_KEY/" $DEST_SCRIPT
#    sed -i "s/REPLACEME_BRAINTREE_PRIVATE_KEY/$BRAINTREE_PRIVATE_KEY/" $DEST_SCRIPT

# fi

npm start
