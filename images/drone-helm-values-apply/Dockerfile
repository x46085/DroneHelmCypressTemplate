# TO BUILD:
# first compile for linux: env GOOS=linux GOARCH=amd64 go build
# then package into container: docker build . --tag x46085/drone-helm-values-apply:25oct19

FROM alpine:3.8
ADD drone-helm-values-apply /bin/
ENTRYPOINT ["/bin/drone-helm-values-apply"]
