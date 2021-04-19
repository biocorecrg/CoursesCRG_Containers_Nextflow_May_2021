/*
*  bowtie module
*/

params.CONTAINER = "quay.io/biocontainers/bowtie:1.2.3--py37hc9558a2_0"
params.OUTPUT = "bowtie_output"

/*
 * Bowtie index
 */
process bowtieIdx {
    container params.CONTAINER
    tag { ref }
    							
    input:
    path ref   							

    output:									
   	tuple val("${ref}"), path ("${ref}*.ebwt")

    script:									
    """
        gunzip -c ${ref} > reference.fa
        bowtie-build reference.fa ${ref}
        rm reference.fa
    """
}

/*
 * Bowtie alignment
 */
process bowtieAln {
    publishDir(params.OUTPUT, pattern: '*.sam')
    container params.CONTAINER
    tag { reads }  							

    input:
    tuple val(refname), path (ref_files)
    path reads  							

    output:									
    path "${reads}.sam", emit: samples_sam
    path "${reads}.log", emit: samples_log

    script:									
    """
    bowtie -p ${task.cpus} ${refname} -q ${reads} -S > ${reads}.sam 2> ${reads}.log
    """
}

workflow BOWTIE_INDEX {
    take: 
    input
    
    main:
		out =  bowtieIdx(input)
    emit:
    	out
}

workflow BOWTIE_MAP {
    take: 
    reads
    reference
    
    main:
		bowtieAln(reads,reference)
    emit:
    	samples_sam = bowtieAln.out.samples_sam
    	samples_log = bowtieAln.out.samples_log
}

