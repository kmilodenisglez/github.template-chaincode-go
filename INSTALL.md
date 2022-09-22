# Chaincode Template as an external service

## Packaging and installing Chaincode

This external chaincode requires two environment variables to run, `CHAINCODE_SERVER_ADDRESS` and `CHAINCODE_ID`, which are described and set in the `chaincode.env` file.

You need to provide a `connection.json` configuration file to your peer in order to connect to the external service. The address specified in the `connection.json` must correspond to the `CHAINCODE_SERVER_ADDRESS` value in `chaincode.env`, which is `127.0.0.1:9999` in our example.

Because we will run our chaincode as an external service, the chaincode itself does not need to be included in the chaincode
package that gets installed to each peer. Only the configuration and metadata information needs to be included
in the package. Since the packaging is trivial, we can manually create the chaincode package.

Open a new terminal and navigate to the `cc-template-go` directory.
```
cd cc-template-go
```

First, create a `code.tar.gz` archive containing the `connection.json` file:
```
tar cfz code.tar.gz connection.json
```

Then, create the chaincode package, including the `code.tar.gz` file and the supplied `metadata.json` file:
```
tar cfz package-chaincode_name.tgz metadata.json code.tar.gz
```

You are now ready to deploy the external chaincode.