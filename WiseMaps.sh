#!/bin/bash
# Sitemap Update Notifier
# Written by Maccmiles for WISE Marketing LLC
# 9-6-18
user="exampleUser"
domain="example.com"
s1="$(cat /home/$user/public_html/LastSitemap.wise)"
s2="$(stat --format "%Y" /home/$user/public_html/sitemap.xml)"
if [ "$s1" = "$s2" ]
then
  exit 0
else
dmod="$(date -d @$s2)"
cyear="$(date +"%Y")"
  stat --format "%Y" /home/$user/public_html/sitemap.xml > /home/$user/public_html/LastSitemap.wise
mail -s "Sitemap Updated" "$user@$domain" <<EOF
Hello, This is an automated message notifying you that the sitemap for $domain was updated on
$dmod

This is an automatically generated email – please do not reply to it. If you have any queries regarding your account please submit a ticket.

Company Name $cyear
EOF
fi