.PHONY: all clean build

all: clean build upload

UPLOAD = aws s3 sync

UPLOAD_PARAMS = --delete --cache-control max-age=2147483648 --acl public-read

SRCS := *.{html,mp4}

DIST = dist/

S3_BUCKET = s3://fuckyesmoney.briansunter.com/

clean:
	rm -rv ${DIST}
	mkdir ${DIST}

build:
	@echo ${SRCS}
	@echo $(SRCS)
	cp ${SRCS} ${DIST}

upload:
	${UPLOAD} ${DIST} ${S3_BUCKET} ${UPLOAD_PARAMS}
