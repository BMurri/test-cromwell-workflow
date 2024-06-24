version 1.0

workflow call2tasks {
    input {
        File inputFile
        String name
    }

    call hello_gen1 {
        input:
            inputFile = inputFile,
            name = name
    }

    call hello_gen2 {
        input:
            inputFile = inputFile,
            name = name
    }
}

task hello_gen1 {
  input {
    String name
    File inputFile
  }

  command {
    echo 'Hello ${name}!'
    cat ${inputFile} > outfile2.txt
  }
  output {
    File outfile1 = stdout()
    File outfile2 = "outfile2.txt"
  }
  runtime {
    docker: 'mcr.microsoft.com/mirror/docker/library/ubuntu:22.04'
    vm_size: "Standard_A1_v2"
    preemptible: true
  }
}

task hello_gen2 {
  input {
    String name
    File inputFile
  }

  command {
    echo 'Hello ${name}!'
    cat ${inputFile} > outfile2.txt
  }
  output {
    File outfile1 = stdout()
    File outfile2 = "outfile2.txt"
  }
  runtime {
    docker: 'mcr.microsoft.com/mirror/docker/library/ubuntu:22.04'
    vm_size: "Standard_D2a_v4"
    preemptible: true
  }
}