# @params
# 1. a var with either error or warning
# 2. Short code for the severity, e.g. F
enable_matcher() {
if [ "$1" == "error" ]; then
  echo "##[add-matcher]._actionshub_problem-matchers/rubocop-$2-error.json"
else
  echo "##[add-matcher]._actionshub_problem-matchers/rubocop-$2-error.json"
fi
}

# Create our working folder:
mkdir ._actionshub_problem-matchers
# # Copy all problem matchers into there
cp /problem-matchers/*.json ._actionshub_problem-matchers

# Activate the problem matchers we need:
enable_matcher $INPUT_SEVERITYFATALLEVEL "F"
enable_matcher $INPUT_SEVERITYERRORLEVEL "E"
enable_matcher $INPUT_SEVERITYWARNINGLEVEL "W"
enable_matcher $INPUT_SEVERITYCONVENTIONLEVEL "C"
enable_matcher $INPUT_SEVERITYREFACTORLEVEL "R"

if [ $INPUT_RUBOCOPGEMVERSION == "latest"]; then
  gem install $INPUT_RUBOCOPGEMNAME
else
  gem install $INPUT_RUBOCOPGEMNAME "$INPUT_RUBOCOPGEMVERSION"
fi

bash -c "$INPUT_RUBOCOPGEMNAME --display-cop-names --extra-details"
