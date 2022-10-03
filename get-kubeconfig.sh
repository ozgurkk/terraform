echo "$(terraform output kube_config)" > ./bbkubeconfig \
## azurek8s file is a KUBECONFIG file.  But file  would be work after removing <<< EOF and EOF tags in the azurek8s file.
export KUBECONFIG=./bbkubeconfig
