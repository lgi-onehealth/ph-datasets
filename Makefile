.PHONY: clean test_modules test_all

clean:
	rm -rf .nextflow* work output datasets

test_modules:
	PROFILE=conda pytest --tag ${TAG} --symlink --kwdof --color=yes --git-aware

test_all:
	PROFILE=conda pytest --symlink --kwdof --color=yes --git-aware

test_docker:
	PROFILE=docker pytest --symlink --kwdof --color=yes --git-aware

test_wf:
	nextflow run main.nf -profile test,conda