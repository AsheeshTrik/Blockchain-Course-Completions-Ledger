var NPTELCompletionRegistry = artifacts.require("./NPTELCompletionRegistry.sol");

module.exports = function(deployer) {
  deployer.deploy(NPTELCompletionRegistry);
};
