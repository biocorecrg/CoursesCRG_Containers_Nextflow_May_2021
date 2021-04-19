/*
*  fastqc module
*/

params.CONTAINER = "quay.io/biocontainers/fastqc:0.11.9--0"
params.OUTPUT = "fastqc_output"

process qc {
    publishDir(params.OUTPUT, mode: 'copy')
    tag { reads }
    container params.CONTAINER

    input:
    path(reads)

    output:
    path("*_fastqc*") 
    
	script:
    """
		fastqc ${reads}
    """
}


workflow FASTQC {
    take: 
    input
    
    main:
		out =  qc(input)
    emit:
    	out
}

