.PHONY: clean test_modules

clean:
	rm -rf .nextflow* work output

test_modules:
	PROFILE=conda nextflow run tests/modules/ffq -entry test_ffq -c tests/config/nextflow.config