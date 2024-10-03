task hello {
  String name
  File inputFile

  command {
    echo 'Hello ${name}!'
    df
    cat ${inputFile} > outfile2.txt
    df >> outfile2.txt
  }
  output {
    File outfile1 = stdout()
    File outfile2 = "outfile2.txt"
  }
  runtime {
    docker: 'ubuntu:22.04'
    disks: "local-disk 100000 SSD"
    preemptible: true
  }
}

workflow test {
  call hello
}
