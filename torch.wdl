version 1.0

workflow torch {
    call torch_task
}

task torch_task {
    input {
        String docker
        String vmsize
        File script
    }

    command {
        python3 ~{script}
    }

    runtime {
        docker: "${docker}"
        vm_size: "${vmsize}"
        preemptible: true
    }
}
