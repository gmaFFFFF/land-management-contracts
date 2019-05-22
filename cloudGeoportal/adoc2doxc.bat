set file=_technicalTask.adoc

asciidoctorj --backend docbook --out-file 1.xml %file%
pandoc --from docbook --to docx --output %file:~0,-5%.docx 1.xml
del 1.xml
pause