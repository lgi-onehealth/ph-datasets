.PHONY: clean test_modules

clean:
	rm -rf .nextflow* work output

test_modules:
	PROFILE=conda pytest --tag ${TAG} --symlink --kwdof --color=yes
