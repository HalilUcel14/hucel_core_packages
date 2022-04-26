library hucel_core;

// /// A Calculator.
// class Calculator {
//   /// Returns [value] plus 1.
//   int addOne(int value) => value + 1;
// }

// ###---< base >---###
export 'src/base/base_error.dart';
export 'src/base/base_model.dart';
export 'src/base/base_state.dart';
export 'src/base/base_view.dart';
export 'src/base/base_view_model.dart';

// ###---< constants >---###
export 'src/constants/app_constants.dart';
export 'src/constants/file_constants.dart';
export 'src/constants/input_constants.dart';
export 'src/constants/navigation_routes.dart';
export 'src/constants/regexp_constants.dart';
export 'src/constants/responsivity_constants.dart';

// ###---< exception >---###
export 'src/exception/error_widget_builder.dart';
export 'src/exception/file_manager_not_found.dart';
export 'src/exception/page_info_exceptions.dart';

// ###---< extension >---###
export 'src/extension/context_extension.dart';
export 'src/extension/decoration_extension.dart';
export 'src/extension/file_extension.dart';
export 'src/extension/future_extension.dart';
export 'src/extension/image_extension.dart';
export 'src/extension/int_extension.dart';
export 'src/extension/list_extension.dart';
export 'src/extension/request_type_extension.dart';
export 'src/extension/string_extension.dart';
export 'src/extension/widget_extension.dart';

// ###---< init - cache >---###
export 'src/init/cache/locale_manager_shared/shared_manager.dart';
export 'src/init/cache/file/locale_file.dart';

// ###---< init - navigation >---###
export 'src/init/navigation/navigation_router.dart';
export 'src/init/navigation/navigation_service.dart';

// ###---< init - theme >---###
export 'src/init/theme/theme_notifier.dart';
export 'src/init/theme/text_theme.dart';
export 'src/init/theme/provider_list.dart';

// ###---< init - theme >---###
export 'src/init/theme/provider_list.dart';
export 'src/init/theme/text_theme.dart';
export 'src/init/theme/theme_notifier.dart';

// ###---< init - utility >---###
export 'src/init/utility/custom_logger.dart';
export 'src/init/utility/show_snackbar.dart';
export 'src/init/utility/device_utility.dart';
export 'src/init/utility/page_animation/slider_route.dart';

// ###---< İnterface >---###
export 'src/interface/i_file_manager.dart';
export 'src/interface/i_navigation_service.dart';

// ###---< Models >---###
export 'src/models/local_file_model.dart';

// ###---< Firebase >---###
export 'src/feature/firebase/authentication/authentication_helper.dart';

// ###---< Widget >---###
export 'src/widget/dynamic_fit_text.dart';
export 'src/widget/random_color_container.dart';
export 'src/widget/random_image.dart';
export 'src/widget/space_sized_box.dart';
