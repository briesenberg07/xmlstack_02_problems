# generate diff from before/after CONTENTdm exports

## what I want to do
1. process 'before' xml export and 'after' xml export
2. pass list of fields (field label/element name) where remediation took place
   - for each of these, if before/after text value different, output before/after
3. pass field (field label/element name) where deprecated values stored, if applicable\*
   - \* but wait I don't need to do this - see step 2
   - if new empty element in 'after' export, don't output
   - if new element with text content, output
   - \* but again, I no longer think this is necessary
   
## what would be nice to do
- process custom export and DC export to yield field-names-as-element-names, with @dc="dc_mapping"
- output some report of changes across collections, in addition to changer per project described above

## questions
- is this necessary?
- what is best output? HTML? XML?

## aside
- Chat GPT > [XML diff help](https://chat.openai.com/share/a7054c6b-54c6-474d-b3a6-2031c515bf19) ... I really think the second answer may be gibberish?

