#!/bin/sh
# URLSchemeFinder-v1 - @pookjw, kidjinwoo@me.com, https://github.com/pookjw/URLSchemeFinder
if [[ -z "${1}" ]]; then
	echo "[file] is empty."
	echo "./URLSchemeFinder.sh [file]"
	exit 1
fi
if [[ ! -f "${1}" ]]; then
	echo "No such file : ${1}"
	exit 1
fi
if [[ -d /tmp/URLSchemeFinder ]]; then
	rm -rf /tmp/URLSchemeFinder
fi
mkdir /tmp/URLSchemeFinder
unzip -j "${1}" Payload/*.app/Info.plist -d /tmp/URLSchemeFinder
if [[ ! -f /tmp/URLSchemeFinder/Info.plist ]]; then
	echo "ERROR!"
	rm -rf /tmp/URLSchemeFinder
	exit 1
fi
defaults read /tmp/URLSchemeFinder/Info.plist CFBundleURLTypes
rm -rf /tmp/URLSchemeFinder
exit 0