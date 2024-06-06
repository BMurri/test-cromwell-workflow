version 1.0

task validate {
  input {
    String vmsize
    String tag
  }
  command {
    nvidia-smi
  }
  runtime {
    docker: "library/ubuntu:" + tag
    vm_size: "~{vmsize}"
    preemptible: true
  }
}

workflow gpu {
  input {
    String vmsize
    String tag
  }
  call validate {
    input: vmsize = vmsize, tag = tag
  }
}
