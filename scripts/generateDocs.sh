rm -rf ../../jsdoc/out
../../jsdoc/jsdoc -l -d ../../jsdoc/out -r ../lib/backbone-x/source ../lib/tools/source ../lib/enyo-x/source/widgets ../lib/enyo-x/source/views #../enyo-client/application/source ../enyo-client/extensions/source ../node-datasource/routes

#using the xtuple templates gives me a Error: fs.writeFileSync requires an encoding on Rhino!
# not sure why
#../../jsdoc/jsdoc -l -t ./templates/xtuple -d ../../jsdoc/out -r ../lib/backbone-x/source
#../../jsdoc/jsdoc -l -t ./templates/xtuple -d ../../jsdoc/out -r ../lib/enyo-x/source/widgets/
#../../jsdoc/jsdoc -l -t ./templates/xtuple -d ../../jsdoc/out -r ../lib/enyo-x/source/views/
