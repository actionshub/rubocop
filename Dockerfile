FROM ruby

LABEL "com.github.actions.name"="ActionsHub-Rubocop"
LABEL "com.github.actions.description"="Run rubocop on your code"

COPY . .

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["bash", "/entrypoint.sh"]
