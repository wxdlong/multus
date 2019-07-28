# multus
Multus for win10 docker-ce !  office URL https://github.com/intel/multus-cni

# Why

If you follow the office get started guide on win10 docker-ce env. k8s DNS pod may can't start.    
>`network: fork/exec /opt/cni/bin/multus`


```bash
kubelet, docker-desktop  (combined from similar events): Failed create pod sandbox: rpc error: code = Unknown desc = failed to set up sandbox container "c0d8f2ad4b30fcf280765599a9b50c8eeab1cc3aa65845188c5c417976373c42" network for pod "coredns-fb8b8dccf-947sp": NetworkPlugin cni failed to set up pod "coredns-fb8b8dccf-947sp_kube-system" network: fork/exec /opt/cni/bin/multus: no such file or directory
```

# So Why

office docker image base on centos, and it need below ldd. But docker-ce base on alpine. So it can't run on docker-ce

```bash

/host/opt/cni/bin # ldd multus
    /lib64/ld-linux-x86-64.so.2 (0x7fdbf457b000)
    libpthread.so.0 => /lib64/ld-linux-x86-64.so.2 (0x7fdbf457b000)
    libc.so.6 => /lib64/ld-linux-x86-64.so.2 (0x7fdbf457b000)
```        

# How

1. Use golang as base image to rebuild the multus docker image.
2. Read and follow the guide. but use images/multus-daemonset.yml instead.
 https://github.com/intel/multus-cni/blob/master/doc/quickstart.md 


 # Contact

 wxdlong@qq.com
