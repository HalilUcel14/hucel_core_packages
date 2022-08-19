typedef BoolCallBack = bool Function();

bool applyBoolFunctions(
  BoolCallBack? function1,
  BoolCallBack? function2,
  BoolCallBack? function3,
) =>
    (function1 ?? function2 ?? function3)?.call() ?? false;
