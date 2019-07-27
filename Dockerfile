from golang as builder

RUN git clone https://github.com/intel/multus-cni.git
RUN cd multus-cni && \
    sh -x build
from scratch
copy  --from=builder multus-cni/bin/multus .