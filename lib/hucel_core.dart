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
export 'src/constants/easy_locale_constants.dart';

// ###---< exception >---###
export 'src/exception/error_widget_builder.dart';
export 'src/exception/file_manager_not_found.dart';
export 'src/exception/page_info_exceptions.dart';

// ###---< extension >---###
export 'src/extension/another_extension.dart';
export 'src/extension/async_extension.dart';
export 'src/extension/context_extension.dart';
export 'src/extension/decoration_extension.dart';
export 'src/extension/file_extension.dart';
export 'src/extension/future_extension.dart';
export 'src/extension/image_extension.dart';
export 'src/extension/int_extension.dart';
export 'src/extension/iterable_extension.dart';
export 'src/extension/list_extension.dart';
export 'src/extension/object_extension.dart';
export 'src/extension/request_type_extension.dart';
export 'src/extension/string_extension.dart';
export 'src/extension/subject_extension.dart';
export 'src/extension/t_extension.dart';
export 'src/extension/uri_extension.dart';
export 'src/extension/widget_extension.dart';
//
// ###---< init - cache >---###
export 'src/init/cache/locale_manager_shared/shared_manager.dart';
export 'src/init/cache/file/locale_file.dart';
//
// ###---< init - navigation >---###
export 'src/init/navigation/navigation_router.dart';
export 'src/init/navigation/navigation_service.dart';
//
// ###---< init - utility >---###
export 'src/init/utility/custom_logger.dart';
export 'src/init/utility/show_snackbar.dart';
export 'src/init/utility/device_utility.dart';
export 'src/init/utility/page_animation/slider_route.dart';
//
// ###---< init - utility >---###
export 'src/init/network/network_connectivity_manager.dart';
//
// ###---< init - theme >---###
export 'src/init/theme/theme_manager.dart';
//
// ###---< İnterface >---###
export 'src/interface/i_file_manager.dart';
export 'src/interface/i_navigation_service.dart';
export 'src/interface/i_firebase_auth.dart';
export 'src/interface/i_theme_manager.dart';
export 'src/interface/i_network_connectivity.dart';
//
// ###---< Models >---###
export 'src/models/local_file_model.dart';
//
// ###---< Firebase >---###
export 'src/feature/firebase/authentication/authentication_helper.dart';
export 'src/feature/firebase/documentation/cloudfirestore_documentation.dart';
export 'src/feature/firebase/firestore/firestore_get_downloadurl.dart';
//
// ###---< Widget >---###
export 'src/widget/dynamic_fit_text.dart';
export 'src/widget/random_color_container.dart';
export 'src/widget/random_image.dart';
export 'src/widget/space_sized_box.dart';
export 'src/widget/error_snackbar.dart';
export 'src/widget/stream_builder_helper.dart';
export 'src/widget/network_connectivity_widget.dart';
//
// ###---< Vandad Tips >---###
export 'src/vandad_tips/animated_icon_tips.dart';
export 'src/vandad_tips/api_caching_image_tips.dart';
export 'src/vandad_tips/async_snapshot_builder.dart';
export 'src/vandad_tips/check_existence_web.dart';
export 'src/vandad_tips/check_if_website_up_down.dart';
export 'src/vandad_tips/chery_picking_bool_function.dart';
export 'src/vandad_tips/circular_progress_in_network_image.dart';
export 'src/vandad_tips/detect_redirects.dart';
export 'src/vandad_tips/detecting_url_file_types.dart';
export 'src/vandad_tips/iterable_tips.dart';
export 'src/vandad_tips/map_tips.dart';
export 'src/vandad_tips/network_image_asset.dart';
export 'src/vandad_tips/network_image_tips.dart';
