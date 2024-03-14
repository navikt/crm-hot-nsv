echo "Oppretter scratch org"
call sf org create scratch --definition-file config\project-scratch-def.json --alias %1 --duration-days %2 --set-default --json --wait 30

echo "Installerer crm-platform-base ver. 0.217"
call sf package install --package 04t7U000000Y3VbQAK --no-prompt --installation-key %3 --wait 30 --publish-wait 30

echo "Installerer crm-platform-access-control ver. 0.125"
call sf package install --package 04t7U000000Y3V7QAK --no-prompt --installation-key %3 --wait 30 --publish-wait 30

echo "Dytter kildekoden til scratch org'en"
call sf project deploy start

::echo "Tildeler tilatelsessett til brukeren"
::call sf org assign permset --name HOT_Lesehjelp_Admin

echo "Creating testdata"
call sf apex run --file scripts/apex/createTestData.apex

echo "Ferdig"
