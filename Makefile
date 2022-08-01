.PHONY: clean test_modules

clean:
	rm -rf .nextflow* work output datasets

test_modules:
	PROFILE=conda pytest --tag ${TAG} --symlink --kwdof --color=yes

test_wf:
	nextflow run main.nf -resume --enable_conda