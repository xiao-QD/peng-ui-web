rm -rf dist &&
yarn build &&
cd dist &&
git init &&
git add . &&
git commit -m "update" &&
git branch -M master &&
git remote add origin git@github.com:xiao-QD/peng-ui-web.git &&
git push -f -u origin master &&
cd -
echo  https://xiao-qd.github.io/peng-ui-web/index.html