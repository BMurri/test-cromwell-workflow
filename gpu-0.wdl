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
    docker: 'mcr.microsoft.com/mirror/docker/library/ubuntu:${tag}'
    preemptible: true
    vm_size: ${vmsize}
  }
}

workflow test {
  call gpu
}
