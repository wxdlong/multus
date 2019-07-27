from golang as builder

RUN git clone https://github.com/intel/multus-cni.git
RUN cd multus-cni && \
    sh -x build
from alpine

RUN apk add --no-cache bash
RUN mkdir -p /usr/src/multus-cni/
copy  --from=builder /go/multus-cni/bin /usr/src/multus-cni/bin
copy  images /usr/src/multus-cni/images

LABEL io.k8s.display-name="Multus CNI" \
      io.k8s.description="This is a component of Alpine Platform and provides a meta CNI plugin." \
      maintainer="Wxdlong <wxdlong@qq.com>"
# does it require a root user?
# USER 1001

ENTRYPOINT /usr/src/multus-cni/images/entrypoint.sh
