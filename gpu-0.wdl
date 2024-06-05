task gpu {
  String vmsize
  String tag

  command {
    nvidia-smi
  }
  output {
    File outfile1 = stdout()
  }
  runtime {
    docker: "mcr.microsoft.com/mirror/docker/library/ubuntu:~{tag}"
    vm_size: "~{vmsize}"
    preemptible: true
  }
}

workflow test {
  call gpu
}
