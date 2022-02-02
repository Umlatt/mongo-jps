Admin Panel: [${env.url}:27017](${env.url}:27017)  
--- mongo ---\
User: mongoadmin\
Password: ${globals.dbpassword}\
\
--- mongo-express ---\
User: root\
Password: ${globals.expresspassword}

To use a custom domain instead of the default environment hostname, please follow [this](http://docs.jelastic.com/custom-domains) guide.
