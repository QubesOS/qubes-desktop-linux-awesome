ifeq (,$(findstring centos,$(DISTRIBUTION)))
RPM_SPEC_FILES := awesome.spec
endif

NO_ARCHIVE := 1
