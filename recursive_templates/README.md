# recursive templates

## Use case 2023-03
- For a given RDA/RDF property, get all subproperties and subproperties of subproperties, etc.
- This is for sinopia_maps > #94 - [add option for all subproperties, and subproperties of subproperties, and [...] as PT prop options](https://github.com/uwlib-cams/sinopia_maps/issues/94)
- BUT:
    - RDA/RDF 'polyhierarchy' yields abundant repeats in output (see 001_nested_output/[output.xml](https://github.com/briesenberg07/xml_stack/blob/6e761b8ca0f44f8b5c3b46b6a8299919ec5ae4c9/recursive_templates/001_nested_output/output_nested_01.xml), `prop @count` values)
    - How to eliminate duplicates?? (Sinopia doesn't allow loading RTs with repeating property IRIs except in very narrow exceptions)
### NOTE 1
Three recursive templates...
- 001_nested_output/[get_rda_all_all_subproperties_nested_01.xsl](https://github.com/briesenberg07/xml_stack/blob/6e761b8ca0f44f8b5c3b46b6a8299919ec5ae4c9/recursive_templates/001_nested_output/get_rda_all_all_subproperties_nested_01.xsl)
- 002_flat_output/[get_rda_all_all_subproperties_flat_01.xsl](https://github.com/briesenberg07/xml_stack/blob/6e761b8ca0f44f8b5c3b46b6a8299919ec5ae4c9/recursive_templates/002_flat_output/get_rda_all_all_subproperties_flat_01.xsl)
- 002_flat_output/[get_rda_all_all_subproperties_flat_02.xsl](https://github.com/briesenberg07/xml_stack/blob/6e761b8ca0f44f8b5c3b46b6a8299919ec5ae4c9/recursive_templates/002_flat_output/get_rda_all_all_subproperties_flat_02.xsl)

...which function\*\* essentially the same, output a different number of elements when retrieving subproperties, subproperties of subproperties, etc. for the RDA/RDF property [has related RDA entity of work](http://rdaregistry.info/Elements/w/P10307). See output from...
- get_rda_all_all_subproperties_nested_01.xsl >>> [output_nested_01.xml](https://github.com/briesenberg07/xml_stack/blob/6e761b8ca0f44f8b5c3b46b6a8299919ec5ae4c9/recursive_templates/001_nested_output/output_nested_01.xml) (1,601 elements in output for P10307)
- get_rda_all_all_subproperties_flat_01.xsl >>> [output_flat_01.xml](https://github.com/briesenberg07/xml_stack/blob/6e761b8ca0f44f8b5c3b46b6a8299919ec5ae4c9/recursive_templates/002_flat_output/output_flat_01.xml#L11-L20) (10 elements in output for P10307)
- get_rda_all_all_subproperties_flat_02.xsl >>> [output_flat_02.xml](https://github.com/briesenberg07/xml_stack/blob/6e761b8ca0f44f8b5c3b46b6a8299919ec5ae4c9/recursive_templates/002_flat_output/output_flat_02.xml#L11-L29) (19 elements in output for P10307)  

\*\* *They seem to function essentially the same **to me**, but I must be missing something!*

#### UPDATE
After correcting error in stylesheet, nested and unnested retrive the same number of sub(sub(sub(sub)))-properties

- get_rda_all_all_subproperties_nested_01.xsl >>> [output_nested_01.xml](https://github.com/briesenberg07/xml_stack/blob/6e761b8ca0f44f8b5c3b46b6a8299919ec5ae4c9/recursive_templates/001_nested_output/output_nested_01.xml) >>> 1,601 elements in output for P10307
- get_rda_all_all_subproperties_flat_01.xsl >>> [output_flat_01.xml](https://github.com/briesenberg07/xml_stack/blob/f67e19888963a3cd7d4f17cc0b15fc822f756ada/recursive_templates/002_flat_output/output_flat_01.xml#L11-L1611) >>> 1,601 elements in output for P10307

### NOTE 2
- It seems like [fn:distinct-values](https://www.w3.org/TR/xpath-functions-31/#func-distinct-values) be helpful in achieving the desired output.
	- See [get_rda_all_all_subproperties_flat_distinct_01.xsl](https://github.com/briesenberg07/xml_stack/blob/e3f0ca419e981f6e0329bb93a9def8c52bc85ce8/recursive_templates/003_distinct_values/get_rda_all_all_subproperties_flat_distinct_01.xsl) for a start on implementing the function.
	- &#10060; - Not attempting to use `fn:distinct-values` because duplicates need to be eliminated not only within a given PT but also *across* PTs
