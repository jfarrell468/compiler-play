#include <iostream>

#include "antlr4-runtime.h"
#include "HelloLexer.h"
#include "HelloParser.h"
#include "HelloBaseListener.h"

using namespace antlr4;

class TreeShapeListener : public HelloBaseListener {
public:
  void enterKey(Ref<ParserRuleContext> ctx) {
    // Do something when entering the key rule.
  }
};


int main(int argc, const char* argv[]) {
  std::ifstream stream;
  stream.open(argv[1]);
  ANTLRInputStream input(stream);
  HelloLexer lexer(&input);
  CommonTokenStream tokens(&lexer);

//  HelloParser parser(&tokens);

//  Ref<tree::ParseTree> tree = parser.key();
//  Ref<TreeShapeListener> listener(new TreeShapeListener());
//  tree::ParseTreeWalker::DEFAULT->walk(listener, tree);

  tokens.fill();
  for (auto token : tokens.getTokens()) {
    std::cout << token->toString() << std::endl;
  }

  HelloParser parser(&tokens);
  tree::ParseTree* tree = parser.r();

  std::cout << tree->toStringTree(&parser) << std::endl << std::endl;

  return 0;
}