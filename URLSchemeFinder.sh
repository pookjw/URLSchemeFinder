#!/bin/sh
# URLSchemeFinder-v3 - @pookjw, kidjinwoo@me.com, https://github.com/pookjw/URLSchemeFinder
if [[ -z "${1}" ]]; then
	echo "[APP | IPA] is empty."
	echo "./URLSchemeFinder.sh [APP | IPA]"
	exit 1
fi
if [[ ! -f "${1}" && ! -d "${1}" ]]; then
	echo "No such file or directory : ${1}"
	exit 1
elif [[ -f "${1}" ]]; then
	if [[ -d /tmp/URLSchemeFinder ]]; then
		rm -rf /tmp/URLSchemeFinder
	fi
	mkdir /tmp/URLSchemeFinder
	unzip -qq -n -j "${1}" "Payload/*.app/Info.plist" -d /tmp/URLSchemeFinder
	if [[ ! -f /tmp/URLSchemeFinder/Info.plist ]]; then
		echo "ERROR! (Invalid IPA)"
		rm -rf /tmp/URLSchemeFinder
		exit 1
	fi
elif [[ -d "${1}" ]]; then
	if [[ -d /tmp/URLSchemeFinder ]]; then
		rm -rf /tmp/URLSchemeFinder
	fi
	mkdir /tmp/URLSchemeFinder
	if [[ ! -f "${1}/Info.plist" ]]; then
		echo "ERROR! (Invalid APP)"
		rm -rf /tmp/URLSchemeFinder
		exit 1
	fi
	cp "${1}/Info.plist" /tmp/URLSchemeFinder/Info.plist
fi
defaults read /tmp/URLSchemeFinder/Info.plist CFBundleURLTypes | grep "CFBundleURLSchemes =         (
            
        );"
rm -rf /tmp/URLSchemeFinder
exit 0