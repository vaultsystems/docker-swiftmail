	docker run --name swiftmail -d -e OS_TENANT_ID= -e OS_USERNAME= -e OS_PASSWORD= -e OS_AUTH_URL= vault/swiftmail

Test it with:

  curl -v -f -X POST -F file=@testmail.txt http://0.0.0.0:5000/