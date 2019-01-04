// Do not emit a diagnostic when there are
// no undefined functions in a contract
func testTopLevelModule_contractHasNoUndefinedFunctions_noDiagnosticEmitted() {
  // Given
  let f = Fixture()
  let contract = buildDummyContractDeclaration()
  let passContext = buildPassContext { (environment) in
    environment.undefinedFunctions(
        in: equal(to: contract.identifier)
      ).thenReturn([])
  }
  var diagnostics: [Diagnostic] = []

  // When
  _ = f.pass.checkAllContractTraitFunctionsDefined(
      environment: passContext.environment!,
      contractDeclaration: contract,
      diagnostics: &diagnostics
    )

  // Then
  XCTAssertEqual(diagnostics.count, 0)
}
