# !/bin/sh

organization="https://dev.azure.com/mseng"

projects="$(az devops project list --org "${organization}" -o tsv --query [].name)"

while Ifs= read -r project
do
    repos="$(az repos list --org "${organization}" -p "${project}" -o tsv --query [].name)"
    echo "=================="
    echo "Repos inside project ${project}"
    echo "${repos}"
done  <<< "${projects}"