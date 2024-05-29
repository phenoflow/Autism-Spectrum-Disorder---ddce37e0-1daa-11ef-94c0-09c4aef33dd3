cwlVersion: v1.0
steps:
  read-potential-cases-disc:
    run: read-potential-cases-disc.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  autism-spectrum-disorder-asd-[x]asperger's---primary:
    run: autism-spectrum-disorder-asd-[x]asperger's---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-disc/output
  autism-spectrum-disorder-asd---primary:
    run: autism-spectrum-disorder-asd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: autism-spectrum-disorder-asd-[x]asperger's---primary/output
  autism-spectrum-disorder-asd-infantile---primary:
    run: autism-spectrum-disorder-asd-infantile---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: autism-spectrum-disorder-asd---primary/output
  residual-autism-spectrum-disorder-asd---primary:
    run: residual-autism-spectrum-disorder-asd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: autism-spectrum-disorder-asd-infantile---primary/output
  autism-spectrum-disorder-asd-childhood---primary:
    run: autism-spectrum-disorder-asd-childhood---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: residual-autism-spectrum-disorder-asd---primary/output
  active-autism-spectrum-disorder-asd---primary:
    run: active-autism-spectrum-disorder-asd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: autism-spectrum-disorder-asd-childhood---primary/output
  developmental-autism-spectrum-disorder-asd---primary:
    run: developmental-autism-spectrum-disorder-asd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: active-autism-spectrum-disorder-asd---primary/output
  "autism-spectrum-disorder-asd-rett\u2019s---primary":
    run: "autism-spectrum-disorder-asd-rett\u2019s---primary.cwl"
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: developmental-autism-spectrum-disorder-asd---primary/output
  "autism-spectrum-disorder-asd-asperger\u2019s---primary":
    run: "autism-spectrum-disorder-asd-asperger\u2019s---primary.cwl"
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: "autism-spectrum-disorder-asd-rett\u2019s---primary/output"
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: "autism-spectrum-disorder-asd-asperger\u2019s---primary/output"
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
