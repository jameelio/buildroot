################################################################################
#
# wpeframework-wifi
#
################################################################################
WPEFRAMEWORK_WIFI_VERSION = 92618b16644b9653513e1be5d24278c94706623f
WPEFRAMEWORK_WIFI_SITE_METHOD = git
WPEFRAMEWORK_WIFI_SITE = git@github.com:Metrological/WPEPluginsPOC.git
WPEFRAMEWORK_WIFI_INSTALL_STAGING = YES
WPEFRAMEWORK_WIFI_DEPENDENCIES = wpeframework

WPEFRAMEWORK_WIFI_CONF_OPTS += -DBUILD_REFERENCE=${WPEFRAMEWORK_WIFI_VERSION}

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_DEBUG),y)
WPEFRAMEWORK_WIFI_CONF_OPTS += -DCMAKE_BUILD_TYPE=Debug
endif

define WPEFRAMEWORK_WIFI_POST_TARGET_REMOVE_HEADERS
    rm -rf $(TARGET_DIR)/usr/include/WPEFramework
endef

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_INSTALL_HEADERS),y)
WPEFRAMEWORK_WIFI_POST_INSTALL_TARGET_HOOKS += WPEFRAMEWORK_WIFI_POST_TARGET_REMOVE_HEADERS
endif

$(eval $(cmake-package))
