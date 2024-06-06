version 1.1

task gpu {
  input {
    String vmsize
    String tag
  }

  command <<<
    nvidia-smi
  >>>
  
  output {
    File outfile1 = stdout()
  }

  runtime {
    container: "mcr.microsoft.com/mirror/docker/library/ubuntu:~{tag}"
    vm_size: "~{vmsize}"
    preemptible: true
  }
}

workflow test {
  call gpu
}
